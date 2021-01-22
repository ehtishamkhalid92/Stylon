//
//  FeadbackViewController.swift
//  Stylon
//
//  Created by Muhammad Usman on 26/05/1441 AH.
//  Copyright © 1441 Macbook. All rights reserved.
//

import UIKit
import FirebaseDatabase


class FeadbackViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var submitBtn: UIButton!
    
    var ref:DatabaseReference?
    var barbarId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(barbarId)
        textView.shadowView()
        submitBtn.shadowView()
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitTapped(_ sender: Any) {
        
        if textView.text!.count < 10 {
            AlertViewController.showAlert(inViewController: self, title: "Feedback", message: "Message should at least 10 character long")
        }else {
            let Key = ref?.childByAutoId().key ?? ""
            var userName = ""
            var phoneNumber = ""
            let defaults = UserDefaults.standard
            if let savedPerson = defaults.object(forKey: userDic) as? Data {
                let decoder = JSONDecoder()
                if let loadedPerson = try? decoder.decode(userModel.self, from: savedPerson) {
                    phoneNumber = loadedPerson.phone ?? ""
                    userName = loadedPerson.name ?? ""
                }
            }
            
            
            let body :[String:Any] = [
                "byUserName":userName,
                "byUserPhoneNumber":phoneNumber,
                "feedback":textView.text!,
                "id":"\(Key)"
            ]
            ref?.child("feedback").child(barbarId).child("\(Key)").setValue(body, andPriority: nil, withCompletionBlock: { (Error, Response) in
                if Error == nil {
                    print(Response)
                    AlertViewController.showAlert(inViewController: self, title: "Feedback", message: "Message send sucessfully")
                    self.textView.text = ""
                }else {
                    print(Error ?? "")
                }
                
            })
            
        }
        
    }
    
    
}
