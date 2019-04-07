import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var swAutoRefresh: UISwitch!
    @IBOutlet weak var slTimeInverval: UISlider!
    @IBOutlet weak var lbTimeInterval: UILabel!
    @IBOutlet weak var scColorScheme: UISegmentedControl!
    
    let config = Settings.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "refresh"), object: nil, queue: nil) { (notification) in
            self.showSettingsOnView()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showSettingsOnView()
    }
    
    @IBAction func changeAutoRefresh(_ sender: UISwitch) {
        config.autoRefresh = sender.isOn
    }
    
    @IBAction func changeColor(_ sender: UISegmentedControl) {
        config.colorScheme = sender.selectedSegmentIndex
    }
    
    @IBAction func changeTimeInterval(_ sender: UISlider) {
        let ti = round(Double(sender.value))
        config.timeInterval = ti
        changeTimeIntervalLabel(with: Int(ti))
    }
    
    func showSettingsOnView() {
        swAutoRefresh.setOn(config.autoRefresh, animated: true)
        slTimeInverval.setValue(Float(config.timeInterval), animated: true)
        changeTimeIntervalLabel(with: Int(config.timeInterval))
        scColorScheme.selectedSegmentIndex = config.colorScheme
    }
    
    func changeTimeIntervalLabel(with value: Int) {
        lbTimeInterval.text = "Mudar após \(value) segundos"
    }
    
}
