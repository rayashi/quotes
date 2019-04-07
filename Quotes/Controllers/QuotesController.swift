
import UIKit

class QuotesViewController: UIViewController {

    @IBOutlet weak var ivAuthor: UIImageView!
    @IBOutlet weak var ivBackgroung: UIImageView!
    @IBOutlet weak var lbQuote: UILabel!
    @IBOutlet weak var lbAuthor: UILabel!
    @IBOutlet weak var ctQuoteTop: NSLayoutConstraint!
    
    let quotesManager = QuotesManager()
    var timer: Timer?
    let config = Settings.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "refresh"), object: nil, queue: nil) { (notification) in
            self.applyColorScheme()
            self.prepareQuote()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        applyColorScheme()
        prepareQuote()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        prepareQuote()
    }
    
    func applyColorScheme() {
        view.backgroundColor = config.colorScheme == 0 ? .white : .black
        lbQuote.textColor = config.colorScheme == 0 ? .black : .white
        lbAuthor.textColor = config.colorScheme == 0 ? .black : .white
    }
    
    func prepareQuote() {
        timer?.invalidate()
        if config.autoRefresh {
            timer = Timer.scheduledTimer(withTimeInterval: config.timeInterval, repeats: true) { timer in
                self.showRandomQuote()
            }
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

