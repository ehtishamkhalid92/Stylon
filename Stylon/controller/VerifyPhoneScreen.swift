//
//  VerifyPhoneScreen.swift
//  Stylon
//
//  Created by Muhammad Usman on 26/05/1441 AH.
//  Copyright © 1441 Macbook. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class VerifyPhoneScreen: UIViewController {
    
    //Mark:- outlets
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var firstTxtField: UITextField!
    @IBOutlet weak var seconTxtField: UITextField!
    @IBOutlet weak var thirdTxtField: UITextField!
    @IBOutlet weak var forthTxtField: UITextField!
    @IBOutlet weak var fiveTxtField: UITextField!
    @IBOutlet weak var sixTxtField: UITextField!
    @IBOutlet weak var verifyBtn: UIButton!
    @IBOutlet weak var logoutBtn: UIButton!
    @IBOutlet weak var shadowBtn: UIButton!
    
    var paramDic = [String:Any]()
    var ref: DatabaseReference!

  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        verifyBtn.shadowView()
        logoutBtn.shadowView()
        
        self.setup()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        firstTxtField.becomeFirstResponder()
    }
    
    
    @IBAction func resendCodeTapped(_ sender: Any) {
    }
    @IBAction func verifyTapped(_ sender: Any) {
        ref = Database.database().reference()
        let verificationID = UserDefaults.standard.string(forKey: authVerificationID)!
        let verificationCode = "\(firstTxtField.text!)\(seconTxtField.text!)\(thirdTxtField.text!)\(forthTxtField.text!)\(fiveTxtField.text!)\(sixTxtField.text!)"
        print(verificationID)
        print(verificationCode)
        let credential = PhoneAuthProvider.provider().credential(
        withVerificationID: verificationID,
        verificationCode: verificationCode)
        Auth.auth().signIn(with: credential) { (authResult, error) in
          if let error = error {
            // ...
            print("There is an Error \(error.localizedDescription)")
            return
          }
            print("You can Login Now")
            var ref: DatabaseReference!
            ref = Database.database().reference()
            let userid = authResult?.user.uid ?? ""
            self.paramDic.updateValue(userid, forKey: "id")
            self.paramDic.updateValue(true, forKey: "phoneVerified")
            self.paramDic.updateValue("", forKey: "url")
            self.paramDic.updateValue("-1", forKey: "usertype")
            self.paramDic.updateValue("0", forKey: "wallet")
            print(self.paramDic)
            ref.child("users").child(userid).setValue(self.paramDic) { (Error, snashot) in
                if Error != nil {
                    print("oops, an error:\(Error?.localizedDescription ?? "")")
                } else {
                    print("completed",snashot)
                }
                let vc = self.storyboard?.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        
    }
    @IBAction func logoutTapped(_ sender: Any) {
    }
    
    func setup (){
        
        firstTxtField.addTarget(self, action: #selector(textChange(textfield:)), for: UIControl.Event.editingChanged)
        seconTxtField.addTarget(self, action: #selector(textChange(textfield:)), for: UIControl.Event.editingChanged)
        thirdTxtField.addTarget(self, action: #selector(textChange(textfield:)), for: UIControl.Event.editingChanged)
        forthTxtField.addTarget(self, action: #selector(textChange(textfield:)), for: UIControl.Event.editingChanged)
        fiveTxtField.addTarget(self , action: #selector(textChange(textfield:)), for: UIControl.Event.editingChanged)
        sixTxtField.addTarget(self, action: #selector(textChange(textfield:)), for: UIControl.Event.editingChanged)
    }
    
    //Mark:-
    @objc func textChange (textfield: UITextField) {
        
        let text = textfield.text
        
        if text?.utf16.count == 1 {
            
            
            switch textfield {
            case firstTxtField:
                seconTxtField.becomeFirstResponder()
                break
            case seconTxtField:
                thirdTxtField.becomeFirstResponder()
                break
            case thirdTxtField:
                forthTxtField.becomeFirstResponder()
                break
            case forthTxtField:
                fiveTxtField.becomeFirstResponder()
                break
            case fiveTxtField:
                sixTxtField.becomeFirstResponder()
                break
            case sixTxtField:
                sixTxtField.resignFirstResponder()
                break
            default:
                break
            }
            
        } else
        
        {
            
        }
        
    }
    
}
