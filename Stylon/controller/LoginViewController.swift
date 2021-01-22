//
//  LoginViewController.swift
//  Stylon
//
//  Created by Muhammad Usman on 26/05/1441 AH.
//  Copyright © 1441 Macbook. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import NKVPhonePicker

struct userModel: Codable {
    public private(set) var id : String?
    public private(set) var email : String?
    public private(set) var name : String?
    public private(set) var password : String?
    public private(set) var phone : String?
    public private(set) var phoneVerified : Bool?
    public private(set) var ImageUrl : String?
    public private(set) var userType : String?
    public private(set) var wallet: String?
}

class LoginViewController: UIViewController {
    
    //MARK:- Outlets and Properties
    @IBOutlet weak var phoneTxtField: NKVPhonePickerTextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var passwordTxtFiield: UITextField!
    
    
    //MARK:- View Life Cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
        loginBtn.shadowView()
        phoneTxtField.attributedPlaceholder = NSAttributedString(string: "+ XX XXX XXXXXXX",attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
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
    }
    
    //MARK:- Actions
    @IBAction func signupBtnTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "signUpViewController") as! signUpViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        let phoneNumber = "+" + phoneTxtField.text!
        let ref = Database.database().reference(withPath: "users")
        ref.queryOrdered(byChild: "phone").queryEqual(toValue: phoneNumber).observeSingleEvent(of: .value, with: { (snapshot) in
            if ( snapshot.value is NSNull ) {
                AlertViewController.showAlert(inViewController: self, title: "Login", message: "User not Found")
            } else {
                for child in snapshot.children {
                    print(child)
                    let snap = child as! DataSnapshot
                    let dict = snap.value as! [String: Any]
                    let email = dict["email"] as! String
                    let userId = dict["id"] as! String
                    let phoneVerified = dict["phoneVerified"] as! Bool
                    let url = dict["url"] as! String
                    let userType = dict["usertype"] as! String
                    let wallet = dict["wallet"] as! String
                    let phone = dict["phone"] as! String
                    let password = dict["password"] as! String
                    let fullname = dict["name"] as! String
                    if phone == phoneNumber && password == self.passwordTxtFiield.text{
                        print("Login sucessFully")
                        UserDefaults.standard.set(true, forKey: loggedIn)
                        UserDefaults.standard.set(fullname, forKey: fullname)
                        let object = userModel.init(id: userId, email: email, name: fullname, password: password, phone: phone, phoneVerified: phoneVerified, ImageUrl: url, userType: userType, wallet: wallet)
                        print(object)
                        let encoder = JSONEncoder()
                        if let encoded = try? encoder.encode(object) {
                            let defaults = UserDefaults.standard
                            defaults.set(encoded, forKey: userDic)
                        }
                        if object.userType == "0" {
                            let SB = UIStoryboard(name: "Main", bundle: nil)
                            let VC = SB.instantiateViewController(withIdentifier: "BarbarViewController") as! BarbarViewController
                            self.navigationController?.pushViewController(VC, animated: true)
                        }else if object.userType == "1" {
                            let SB = UIStoryboard(name: "Main", bundle: nil)
                            let VC = SB.instantiateViewController(withIdentifier: "bookBarberViewController") as! bookBarberViewController
                            self.navigationController?.pushViewController(VC, animated: true)
                        }else {
                            let SB = UIStoryboard(name: "Main", bundle: nil)
                            let VC = SB.instantiateViewController(withIdentifier: "selcetViewController") as! selcetViewController
                            self.navigationController?.pushViewController(VC, animated: true)
                        }
                        
                    }else{
                        AlertViewController.showAlert(inViewController: self, title: "Login", message: "Wrong Password")
                    }
                }
                
            }
        }) { (Error) in
            print(Error.localizedDescription)
        }
    }
    
}
