//
//  AddWalletViewController.swift
//  Stylon
//
//  Created by Ehtisham Khalid on 07/02/2020.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit
import NKVPhonePicker
import TextFieldEffects
import Firebase

class AddWalletViewController: UIViewController {
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var phoneTextField: NKVPhonePickerTextField!
    @IBOutlet weak var amountTextField: HoshiTextField!
    @IBOutlet weak var submitBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submitBtn.shadowView()
        
        phoneTextField.attributedPlaceholder = NSAttributedString(string: "+ XX XXX XXXXXXX",attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        phoneTextField.autocorrectionType = .no
        phoneTextField.phonePickerDelegate = self
        phoneTextField.keyboardType = .numberPad
        phoneTextField.favoriteCountriesLocaleIdentifiers = ["LB"]
        
        phoneTextField.textColor = UIColor.white
        phoneTextField.textFieldTextInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)

        // prefilling
        let source = NKVSource(countryCode: "PK")
        phoneTextField.setCurrentCountryInitially = false
        phoneTextField.preFillText(source: source, number: 92)
        phoneTextField.customPhoneFormats = ["RU" : "# ### ### ## ##",
                                                         "GB": "## #### #########", "PK" : "## ### #######"]
        
        
        submitBtn.addTarget(self, action: #selector(submitBtnTapped), for: .touchUpInside)
        let defaults = UserDefaults.standard
        if let savedPerson = defaults.object(forKey: userDic) as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(userModel.self, from: savedPerson) {
                print(loadedPerson)
                self.navigationItem.title = "Wallet"
                self.nameLbl.text = loadedPerson.name ?? ""
            }
        }
        // Do any additional setup after loading the view.
    }
    
    @objc func submitBtnTapped() {
        if phoneTextField.text!.count < 12 {
            AlertViewController.showAlert(inViewController: self, title: "Wallet", message: "Please enter phone number")
        }else if amountTextField.text!.isEmpty{
            AlertViewController.showAlert(inViewController: self, title: "Wallet", message: "Please enter amount")
        }else {
            let phoneNumber = "+" + phoneTextField.text!
            let ref = Database.database().reference(withPath: "users")
            ref.queryOrdered(byChild: "phone").queryEqual(toValue: phoneNumber).observeSingleEvent(of: .value, with: { (snapshot) in
                if ( snapshot.value is NSNull ) {
                    AlertViewController.showAlert(inViewController: self, title: "Taqwim", message: "User not Found")
                } else {
                    var userId = ""
                    var walletAmount = ""
                    var name = ""
                    for child in snapshot.children {
                        let snap = child as! DataSnapshot
                        let dict = snap.value as! [String: Any]
                        userId = dict["id"] as! String
                        walletAmount = dict["wallet"] as! String
                        name = dict["name"] as! String
                    }
                    
                    let previousAmount = Int(walletAmount) ?? 0
                    let newAmount = Int(self.amountTextField.text!) ?? 0
                    let finalWalletAmount = previousAmount + newAmount
                    print("wallet amount",finalWalletAmount)
                    let body :[String:Any] = [
                        "wallet": "\(finalWalletAmount)"
                    ]
                    print(body)
                    ref.child(userId).updateChildValues(body, withCompletionBlock: { (Err, response) in
                        if Err == nil {
                            AlertViewController.showAlert(inViewController: self, title: name , message: "SucessFully Added")
                            self.amountTextField.text = ""
                            self.phoneTextField.text = ""
                        }
                        
                    })
                }
            }) { (Error) in
                print(Error.localizedDescription)
            }
        }
    }

}
