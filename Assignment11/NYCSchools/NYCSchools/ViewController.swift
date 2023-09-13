//
//  ViewController.swift
//  NYCSchools
//
//  Created by Ronnie Kissos on 9/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var highSchools: [HighSchool] = []
    let dataSession = DataSession()
    var selectedIndex = 0
    var schooldbn = ""
    var schoolname = " "
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        Task{
            await self.dataSession.fetchData(from:self.dataSession.highSchoolsURL)
            print(dataSession.schools)
            self.tableView.reloadData()
        }
        
    }
    
 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "navigateToSat" {
            let satViewController = segue.destination as!  SATScoresViewController
            //satViewController.name.text = viewModel.schools[selectedIndex].schoolName
        }
    }
}



extension ViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)  -> Int {
        print(self.dataSession.schools.count)
        
        return dataSession.schools.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: "HighSchoolCell", for: indexPath) as? ScoreCell else{return UITableViewCell()}
        
        cell.title.text = self.dataSession.schools[indexPath.item].schoolName
        //cell.location.text = viewModel.schools[indexPath.item].location
        //cell.website.text =  viewModel.schools[indexPath.item].website
        /*cell.didDelete = {
            self.viewModel.schools.remove(at:indexPath.item)
            var tempSchool = self.viewModel.schools
            self.viewModel.schools = tempSchool
            self.tableView.reloadData()
        }*/
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        self.schooldbn = dataSession.schools[selectedIndex].dbn ?? ""
        self.schoolname = dataSession.schools[selectedIndex].schoolName ?? ""
        if let viewController = storyboard?.instantiateViewController(identifier: "satViewController") as? SATScoresViewController {
            viewController.namePlaceHolder = self.schoolname
            viewController.dbnPlaceHolder = self.schooldbn
                
            navigationController?.pushViewController(viewController, animated: true)
            }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
