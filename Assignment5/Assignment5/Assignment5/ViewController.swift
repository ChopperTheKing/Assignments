//
//  ViewController.swift
//  Assignment5
//
//  Created by Ronnie Kissos on 8/29/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView! // Connect this outlet to your table view in the storyboard
    
    @IBOutlet weak var imageView: UIImageView!
    
    let students = [
        Student(name: "George", email: "alice@gmail.com", dateOfBirth: "01/05/2000", imageName: "george"),
        Student(name: "Steve", email: "stev345@icloud.com", dateOfBirth: "05/29/2000", imageName: "steve"),
        Student(name: "May", email: "mayyyX67@yahoo.com", dateOfBirth: "08/23/2000", imageName: "may"),
        Student(name: "Kyle", email: "tru$edvyper23@msn.com", dateOfBirth: "02/02/1999", imageName: "kyle"),
        Student(name: "Johnny", email: "johnjon@verizon.com", dateOfBirth: "11/15/2000", imageName: "johnny"),
        Student(name: "Grace", email: "12hearts12@gmail.com", dateOfBirth: "06/09/2000", imageName: "grace"),
        Student(name: "Matilda", email: "damdaniel345@me.com", dateOfBirth: "06/11/2001", imageName: "matilda"),
        Student(name: "Vanessa", email: "prncespeachs982@me.com", dateOfBirth: "05/02/2000", imageName: "vanessa"),
        Student(name: "Chad", email: "chaddington65@yahoo.com", dateOfBirth: "05/19/2000", imageName: "chad"),
        Student(name: "Betty", email: "notlikeothergrlz@yahoo.com", dateOfBirth: "12/12/2001", imageName: "betty"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath)
        let student = students[indexPath.row]
            cell.textLabel?.text = student.name
            cell.detailTextLabel?.text = "\(student.email), \(student.dateOfBirth)"
        if let imageView = cell.imageView {
            imageView.image = UIImage(named: student.imageName)
        }
        return cell
    }
}


    



