//
//  bookBarberViewController.swift
//  Stylon
//
//  Created by Muhammad Usman on 26/05/1441 AH.
//  Copyright © 1441 Macbook. All rights reserved.
//

import UIKit
import Firebase

struct barbarListModel {
    let name: String?
    let id : String?
    let phone : String?
}

class bookBarberViewController: UIViewController {
    
    @IBOutlet weak var barbarTableView: UITableView!
    
    var barbarArray = [barbarListModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        getBabarList()
        
        // Decode User Data
        let defaults = UserDefaults.standard
        if let savedPerson = defaults.object(forKey: userDic) as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(userModel.self, from: savedPerson) {
                print(loadedPerson)
            }
        }
        
        
        // Do any additional setup after loading the view.
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(true)
//        self.navigationItem.hidesBackButton = true
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationItem.hidesBackButton = true
    }
    
    private func getBabarList() {
        let ref = Database.database().reference(withPath: "barbers")
        ref.queryOrdered(byChild: "name").observeSingleEvent(of: .value, with: { (snapshot) in
            if ( snapshot.value is NSNull ) {
                print("not found") //didnt find it, ok to proceed
            } else {
                for child in snapshot.children {
                    print(child)
                    let snap = child as! DataSnapshot
                    let dict = snap.value as! [String: Any]
                    let nameBabar = dict["name"] as! String
                    let id = dict["id"] as! String
                    let phone = dict["phone"] as! String
                    let object = barbarListModel.init(name: nameBabar, id: id, phone: phone)
                    self.barbarArray.append(object)
                }
                print(self.barbarArray)
                self.barbarTableView.reloadData()
            }
        }) { (Error) in
            print(Error.localizedDescription)
        }
  
    }
    

  

}
extension bookBarberViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return barbarArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BarbarListTableViewCell
        cell.nameLbl.text = barbarArray[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let instance = barbarArray[indexPath.row]
        let vc = self.storyboard?.instantiateViewController(identifier: "userAuthViewController") as! userAuthViewController
        vc.barbarName = instance.name ?? ""
        vc.BabarId = instance.id ?? ""
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
