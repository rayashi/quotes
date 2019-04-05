import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var swAutoRefresh: UISwitch!
    @IBOutlet weak var slTimeInverval: UISlider!
    @IBOutlet weak var lbTimeInterval: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func changeAutoRefresh(_ sender: UISwitch) {
        
    }
    
    @IBAction func changeColor(_ sender: UISegmentedControl) {
        
        
    }
    
    @IBAction func changeTimeInterval(_ sender: UISlider) {
        
    }
    
}
