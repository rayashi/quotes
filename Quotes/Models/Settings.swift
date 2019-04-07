import Foundation


enum settingType: String {
    case timeInterval = "timeinterval"
    case colorScheme = "colorscheme"
    case autoRefresh = "autorefresh"
}
class Settings {
    
    let defaults = UserDefaults.standard
    
    static let shared: Settings = Settings()
    
    var timeInterval: Double {
        get {
            return defaults.double(forKey: settingType.timeInterval.rawValue)
        }
        set {
            defaults.set(newValue, forKey: settingType.timeInterval.rawValue)
        }
    }
    
    var colorScheme: Int {
        get {
            return defaults.integer(forKey: settingType.colorScheme.rawValue)
        }
        set {
            defaults.set(newValue, forKey: settingType.colorScheme.rawValue)
        }
    }
    
    var autoRefresh: Bool {
        get {
            return defaults.bool(forKey: settingType.autoRefresh.rawValue)
        }
        set {
            defaults.set(newValue, forKey: settingType.autoRefresh.rawValue)
        }
    }
    
    private init() {
        if defaults.double(forKey: settingType.timeInterval.rawValue) == 0 {
            defaults.set(8.0, forKey: settingType.timeInterval.rawValue)
        }
    }
}
