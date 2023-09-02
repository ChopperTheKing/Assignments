//
//  ViewController.swift
//  Assignment7
//
//  Created by Ronnie Kissos on 8/31/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var sectionOneData: [Settings] = [
        Settings(name: "VoiceOver", imageName: "dot.arrowtriangles.up.right.down.left.circle", subtitle: "On", hasSwitch: true),
        Settings(name: "Zoom", imageName: "minus.magnifyingglass"),
        Settings(name: "Motion", imageName: "waveform"),
        Settings(name: "Spoken Content", imageName: "speaker.wave.2"),
        Settings(name: "Display & Text Size", imageName: "textformat.size"),
        Settings(name: "Audio Descriptions", imageName: "headphones")
    ]
    
    var sectionTwoData: [Settings] = [
        Settings(name: "Touch Accommodations", imageName: "hand.tap"),
        Settings(name: "Switch Control", imageName: "arrow.right.arrow.left"),
        Settings(name: "Voice Control", imageName: "mic.fill"),
        Settings(name: "Face ID & Attention", imageName: "faceid"),
        Settings(name: "Side Button", imageName: "power"),
        Settings(name: "Apple Watch Mirroring", imageName: "applewatch"),
        Settings(name: "Control Nearby Devices", imageName: "wifi"),
        Settings(name: "Apple TV Remote", imageName: "tv"),
        Settings(name: "Keyboards", imageName: "keyboard")
    ]

    var sectionThreeData: [Settings] = [
        Settings(name: "Guided Access", imageName: "lock.rectangle"),
        Settings(name: "Siri", imageName: "mic.fill"),
        Settings(name: "Accessibility Shortcut", imageName: "option"),
        Settings(name: "Per-App Settings", imageName: "apps.iphone")
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
        cell.detailTextLabel?.text = currentSetting.subtitle
        cell.imageView?.image = UIImage(systemName: currentSetting.imageName)
        
        if currentSetting.hasSwitch {
            let toggleSwitch = UISwitch()
            cell.accessoryView = toggleSwitch
        } else {
            cell.accessoryView = nil
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3 // Update this to the number of sections you have
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "VISION"
        case 1:
            return "PHYSICAL & MOTOR"
        case 2:
            return "GENERAL"
        default:
            return nil
        }
    }

}
