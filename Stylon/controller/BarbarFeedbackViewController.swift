//
//  BarbarFeedbackViewController.swift
//  Stylon
//
//  Created by Ehtisham Khalid on 07/02/2020.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit
import Firebase
struct feedbackModel {
    let feedback : String?
    let name : String?
}

class BarbarFeedbackViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    lazy var array = [feedbackModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserFeedback()
        self.navigationItem.title = "Feed back"
        // Do any additional setup after loading the view.
        
        
    }
    
    
    private func getUserFeedback() {
        var userID = ""
        let defaults = UserDefaults.standard
        if let savedPerson = defaults.object(forKey: userDic) as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(userModel.self, from: savedPerson) {
                print(loadedPerson)
                userID = loadedPerson.id ?? ""
            }
        }
        
        let ref = Database.database().reference(withPath: "feedback").child(userID)
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            if ( snapshot.value is NSNull ) {
                print("not found") //didnt find it, ok to proceed
            } else {
                for child in snapshot.children {
                    let snap = child as! DataSnapshot
                    let dict = snap.value as! [String: Any]
                    print(dict)
                    let byUserName = dict["byUserName"] as! String
                    let feedback = dict["feedback"] as! String
                    let object = feedbackModel.init(feedback: feedback, name: byUserName)
                    self.array.append(object)
                }
                self.tableView.reloadData()
                
            }
        }) { (Error) in
            print(Error.localizedDescription)
        }
        
    }

}
extension BarbarFeedbackViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BarbarFeedbackTableViewCell
        cell.nameLbl.text = array[indexPath.row].name
        cell.feedbackLbl.text = array[indexPath.row].feedback
        let name = array[indexPath.row].name
        let letter = name?.prefix(1)
        cell.RoundLbl.layer.shadowOpacity = 1
        cell.RoundLbl.layer.shadowRadius = 1
        cell.RoundLbl.layer.cornerRadius = 25
          cell.RoundLbl.layer.borderWidth = 2
          cell.RoundLbl.layer.shadowOffset = CGSize(width: 0.1, height: 0.3)
        cell.RoundLbl.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        cell.RoundLbl.text = letter?.uppercased()
        return cell
    }
    
    
}
