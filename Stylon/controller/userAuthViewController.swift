//
//  userAuthViewController.swift
//  Stylon
//
//  Created by Muhammad Usman on 26/05/1441 AH.
//  Copyright © 1441 Macbook. All rights reserved.
//

import UIKit

class userAuthViewController: UIViewController {
    @IBOutlet weak var bookBtn: UIButton!
    @IBOutlet weak var walletBtn: UIButton!
    @IBOutlet weak var feadBackBtn: UIButton!
    @IBOutlet weak var logoutBtn: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var myAppoitnmentsBtn: UIButton!
    
    
    var barbarName = ""
    var BabarId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookBtn.shadowView()
        walletBtn.shadowView()
        feadBackBtn.shadowView()
        logoutBtn.shadowView()
        myAppoitnmentsBtn.shadowView()
        
        let defaults = UserDefaults.standard
        if let savedPerson = defaults.object(forKey: userDic) as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(userModel.self, from: savedPerson) {
                print(loadedPerson)
                self.navigationItem.title = loadedPerson.name
            }
        }

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationItem.hidesBackButton = false
    }
    
    @IBAction func bookBarberTapped(_ sender: UIButton) {
         let vc = storyboard?.instantiateViewController(identifier: "BookingViewController") as! BookingViewController
        vc.barbarId = self.BabarId
         self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func walletTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "WalletViewController") as! WalletViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func myAppointmentsBtnTapped(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "AppointmentsViewController") as! AppointmentsViewController
        vc.barbarId = BabarId
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func feadbackTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "FeadbackViewController") as! FeadbackViewController
        vc.barbarId = BabarId
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func logoutTapped(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: loggedIn)
        UserDefaults.standard.set(nil, forKey: name)
        UserDefaults.standard.set(nil, forKey: userDic)
        let SB = UIStoryboard(name: "Main", bundle: nil)
        let VC = SB.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let NavController = UINavigationController(rootViewController: VC)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = NavController
    }
    
    @IBAction func cancelBtnTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
