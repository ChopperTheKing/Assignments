import UIKit


// Theory

// 1. what is protocol delegate pattern, write some samle code to explin

// This is a pattern that is a way for one object to talk to another object without them being directly connected.

//You create a protocol which is like a to-do list that a higher up designates to a subordinate
//In this case, the imaginary situation is like an attorney and a paralegal
//The attorney handles the important responsibilities, but delegates some tasks to a subordinate
//protocol ResearchCompleteDelegate {
//    func researchIsComplete()  // Task: Notify when research is done.
//}

//The attorney has his own set of tasks
//class Attorney {
//    var delegate: ResearchCompleteDelegate?  // The Paralegal
//
//    func prepareCase() {
//        print("Attorney is preparing the case...")
//        // ... some time passes ...
//        print("Attorney says research is complete!")
//        delegate?.researchIsComplete()  // Inform the paralegal that the research is complete.
//    }
//}

//Th paralegal handles certain tasks that the attorney doesn't have time to handle
//class Paralegal: ResearchCompleteDelegate {
//    func researchIsComplete() {
//        print("Paralegal organizes the case files.")
//    }
//}

//Putting it all together
//let myParalegal = Paralegal()  // Create the paralegal
//let myAttorney = Attorney()    // Create the attorney
//myAttorney.delegate = myParalegal  // Tell the attorney who the paralegal is
//
//myAttorney.prepareCase()  // Start case preparation

//Output:
//Attorney is preparing the case...
//Attorney says research is complete!
//Paralegal organizes the case files.


// 2. Steps to create tableView

// 1. Open up the main storyboard
// 2. Press the plus button on the top right to open up the objects library
// 3. search or look for tableview
// 4. Drop it on the main view
// 5. add constraints so that it fits in the entire page
// 6. inside the tableview, drag and drop a tableview cell
// 7. select cell and give it an identifier
// 8. Create a new viewcontroller that you want the tableview to reside in
// 9. Link viewcontroller with tableview storyboard using control + drag
// 10. Control-drag from the TableView in the storyboard to the ViewController.swift file to create an IBOutlet.
// 11. Conform ViewController to UITableViewSource: class ViewController: UIViewController, UITableViewDataSource {
// 12. Implement these methods for TableView DataSource:
// func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//return 10  // Example count
//}
//
//func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
//cell.textLabel?.text = "Row \(indexPath.row)"
//return cell
//}
// 13. In viewDidLoad method, add:
// tableView.dataSource = self


// 3. what is use of storyboard refrence

// They allow you to break down a storyboard into multiple storyboards while still maintaining relationships between ViewControllers. This allows you to reuse your storyboards in multiple places, it makes your storyboards easier to read, and it makes it easy for multiple developers to work on these storyboards simultanously without merging issues.

// 4. what is segue

// A segue represents a transition from one viewcontroller to the next. You can accomplish this by control + dragging from one viewcontroller to another. This will allow you to do something like pressing a button on one viewcontroller to go to a different viewcontroller.

// Practical


// 1. Create a talbeview and dispaly list of 10 students using array

    // Student should have name , email , dob, avtar
    // use avtar image from assets



// 2. Write logic for calculator UI.


// 3. from Loginview controller navigate to Student list .
