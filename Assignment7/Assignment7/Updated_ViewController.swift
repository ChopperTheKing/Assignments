
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    // Create a Settings class to manage name and image
    class Settings {
        var name: String
        var imageName: String
        init(name: String, imageName: String) {
            self.name = name
            self.imageName = imageName
        }
    }

    var sectionOneData: [Settings] = [
        Settings(name: "VoiceOver", imageName: "dot.arrowtriangles.up.right.down.left.circle"),
        Settings(name: "Zoom", imageName: "minus.magnifyingglass"),
        // Add more items here
    ]
    
    var sectionTwoData: [Settings] = [
        Settings(name: "Touch", imageName: "hand.point.up.left"),
        Settings(name: "Face ID & Attention", imageName: "faceid"),
        // Add more items here
    ]
    
    var sectionThreeData: [Settings] = [
        Settings(name: "Guided Access", imageName: "lock.rectangle"),
        Settings(name: "Siri", imageName: "mic.fill"),
        // Add more items here
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return sectionOneData.count
        case 1:
            return sectionTwoData.count
        case 2:
            return sectionThreeData.count
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Settings", for: indexPath)
        
        var currentSetting: Settings
        
        switch indexPath.section {
        case 0:
            currentSetting = sectionOneData[indexPath.row]
        case 1:
            currentSetting = sectionTwoData[indexPath.row]
        case 2:
            currentSetting = sectionThreeData[indexPath.row]
        default:
            return UITableViewCell() // Return an empty cell if something goes wrong
        }
        
        cell.textLabel?.text = currentSetting.name
        cell.imageView?.image = UIImage(systemName: currentSetting.imageName)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
}
