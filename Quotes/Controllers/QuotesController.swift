
import UIKit

class QuotesViewController: UIViewController {

    @IBOutlet weak var ivAuthor: UIImageView!
    @IBOutlet weak var ivBackgroung: UIImageView!
    @IBOutlet weak var lbQuote: UILabel!
    @IBOutlet weak var lbAuthor: UILabel!
    @IBOutlet weak var ctQuoteTop: NSLayoutConstraint!
    
    let quotesManager = QuotesManager()
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareQuote()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        prepareQuote()
    }
    
    func prepareQuote() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 8.0, repeats: true) { timer in
            self.showRandomQuote()
        }
        showRandomQuote()
    }
    
    func showRandomQuote() {
        let quote = quotesManager.getRandomQuote()
        lbQuote.text = quote.quote
        lbAuthor.text = quote.author
        ivAuthor.image = UIImage(named: quote.image)
        ivBackgroung.image = ivAuthor.image
        
        lbQuote.alpha = 0.0
        lbAuthor.alpha = 0.0
        ivAuthor.alpha = 0.0
        ivBackgroung.alpha = 0.0
        ctQuoteTop.constant = 50
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 1) {
            self.lbQuote.alpha = 1
            self.lbAuthor.alpha = 1
            self.ivAuthor.alpha = 1
            self.ivBackgroung.alpha = 1
            self.ctQuoteTop.constant = 10
            self.view.layoutIfNeeded()
        }
    }

}

