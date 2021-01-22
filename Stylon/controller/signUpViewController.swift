//
//  signUpViewController.swift
//  Stylon
//
//  Created by Muhammad Usman on 26/05/1441 AH.
//  Copyright © 1441 Macbook. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import NKVPhonePicker

class signUpViewController: UIViewController {
    
     //Mark: Outlets
    @IBOutlet weak var fName: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var passwrodTxtField: UITextField!
    @IBOutlet weak var phoneTxtField: NKVPhonePickerTextField!
    @IBOutlet weak var signupBtn: UIButton!
    
    // MARK:- Variable
    
//    var ref: DatabaseReference!
   
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        signupBtn.shadowView()
        phoneTxtField.placeholder = "+ XX XXX XXXXXXX"
        phoneTxtField.autocorrectionType = .no
        phoneTxtField.phonePickerDelegate = self
        phoneTxtField.keyboardType = .numberPad
        phoneTxtField.favoriteCountriesLocaleIdentifiers = ["LB"]
        
        phoneTxtField.textColor = UIColor.white
        phoneTxtField.textFieldTextInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)

        // prefilling
        let source = NKVSource(countryCode: "PK")
        phoneTxtField.setCurrentCountryInitially = false
        phoneTxtField.preFillText(source: source, number: 92)
        
        phoneTxtField.customPhoneFormats = ["RU" : "# ### ### ## ##",
                                                         "GB": "## #### #########", "PK" : "## ### #######"]

        // Do any additional setup after loading the view.
    }
    
   
    //MARK:- Actions
    @IBAction func signUpTapped(_ sender: UIButton) {
        if fName.text!.isEmpty{
            AlertViewController.showAlert(inViewController: self, title: "Empty First Name", message: "Please enter you First name")
        }else if lastNameTextField.text!.isEmpty {
            AlertViewController.showAlert(inViewController: self, title: "Empty Last Name", message: "Please enter you last name")
        }else if passwrodTxtField.text!.isEmpty {
            AlertViewController.showAlert(inViewController: self, title: "Empty Password", message: "Please enter you Password")
        }else if phoneTxtField.text!.isEmpty {
            AlertViewController.showAlert(inViewController: self, title: "Empty Phone Number", message: "Please enter you Phone Number")
        }else if phoneTxtField.text!.count < 11 {
            AlertViewController.showAlert(inViewController: self, title: "Incorrect Phone Number", message: "Please enter you Correct Phone Number")
        }else {
            authenticateUser()
        }
    }
    
    @IBAction func signInTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func authenticateUser() {
        let phoneNumber = "+" + phoneTxtField.text!
        let ref = Database.database().reference(withPath: "users")
        ref.queryOrdered(byChild: "phone").queryEqual(toValue: phoneNumber).observeSingleEvent(of: .value, with: { (snapshot) in
            if ( snapshot.value is NSNull ) {
                self.registerWithOTP()
            } else {
                AlertViewController.showAlert(inViewController: self, title: "Sign up", message: "Phone Number alraedy Exists")
                self.phoneTxtField.text = "92"
                self.fName.text = ""
                self.lastNameTextField.text = ""
                self.passwrodTxtField.text = ""
            }
        }) { (Error) in
            print(Error.localizedDescription)
        }
    }
    
    private func registerWithOTP() {
        let phoneNumber = "+" + phoneTxtField.text!
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
          if let error = error {
            AlertViewController.showAlert(inViewController: self, title: "Stylon", message: error.localizedDescription)
            return
          }
          // Sign in using the verificationID and the code sent to the user
          // ...
            UserDefaults.standard.set(verificationID, forKey: authVerificationID)
                let vc = self.storyboard?.instantiateViewController(identifier: "VerifyPhoneScreen") as! VerifyPhoneScreen
                vc.paramDic = [
                    "email" : "",
                    "name":"\(self.fName.text!) \(self.lastNameTextField.text!)",
                    "password":self.passwrodTxtField.text!,
                    "phone": "+" + self.phoneTxtField.text!
                ]
                self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
