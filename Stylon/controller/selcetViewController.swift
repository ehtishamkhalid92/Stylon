//
//  selcetViewController.swift
//  Stylon
//
//  Created by Muhammad Usman on 26/05/1441 AH.
//  Copyright © 1441 Macbook. All rights reserved.
//

import UIKit
import Firebase

class selcetViewController: UIViewController {

    @IBOutlet weak var barberBtn: UIButton!
    @IBOutlet weak var userBtn: UIButton!
    @IBOutlet weak var imageBtn: UIImageView!
    
    var ref:DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        barberBtn.shadowView()
        userBtn.shadowView()
        imageBtn.shadowView()
        barberBtn.addTarget(self, action: #selector(barbarBtnTapped(sender:)), for: .touchUpInside)
        
        let fullName = UserDefaults.standard.string(forKey: name)
        self.navigationItem.title = fullName

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationItem.hidesBackButton = false
    }
    
    @objc func barbarBtnTapped(sender: UIButton) {
        
        var userId = ""
        
        let defaults = UserDefaults.standard
        if let savedPerson = defaults.object(forKey: userDic) as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(userModel.self, from: savedPerson) {
                userId = loadedPerson.id ?? ""
            }
        }
        
        
        let body :[String:Any] = [
            "usertype": "0"
        ]
        ref?.child("users").child(userId).updateChildValues(body, withCompletionBlock: { (Err, response) in
            print("Response")
            if Err == nil {
                let vc = self.storyboard?.instantiateViewController(identifier: "BarbarViewController") as! BarbarViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
        })
//            .setValue(body, andPriority: nil, withCompletionBlock: { (Error, Response) in
//            if Error == nil {
//                print(Response)
//                AlertViewController.showAlert(inViewController: self, title: "Feedback", message: "Message send sucessfully")
//                self.textView.text = ""
//            }else {
//                print(Error ?? "")
//            }
//
//        })
        
    }
    
    @IBAction func userTapped(_ sender: UIButton) {
     var userId = ""
        
        let defaults = UserDefaults.standard
        if let savedPerson = defaults.object(forKey: userDic) as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(userModel.self, from: savedPerson) {
                userId = loadedPerson.id ?? ""
            }
        }
        
        
        let body :[String:Any] = [
            "usertype": "1"
        ]
        ref?.child("users").child(userId).updateChildValues(body, withCompletionBlock: { (Err, response) in
            print("Response")
            if Err == nil {
                let vc = self.storyboard?.instantiateViewController(identifier: "userAuthViewController") as! userAuthViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
        })
    }
    
  

}
