//
//  BarbarViewController.swift
//  Stylon
//
//  Created by Ehtisham Khalid on 07/02/2020.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit

class BarbarViewController: UIViewController {
    @IBOutlet weak var barbarScheduleBtn: UIButton!
    @IBOutlet weak var walletBtn: UIButton!
    @IBOutlet weak var feedbackBtn: UIButton!
    @IBOutlet weak var logoutBtn: UIButton!
    lazy var barbarId = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        barbarScheduleBtn.shadowView()
        walletBtn.shadowView()
        feedbackBtn.shadowView()
        logoutBtn.shadowView()
        feedbackBtn.addTarget(self, action: #selector(feedbackBtnTapped(sender:)), for: .touchUpInside)
        walletBtn.addTarget(self, action: #selector(walletBtnTapped(sender:)), for: .touchUpInside)
        logoutBtn.addTarget(self, action: #selector(logoutBtnTapped(sender:)), for: .touchUpInside)
        barbarScheduleBtn.addTarget(self, action: #selector(ScheduleBtnTapped(sender:)), for: .touchUpInside)
        
        let defaults = UserDefaults.standard
        if let savedPerson = defaults.object(forKey: userDic) as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(userModel.self, from: savedPerson) {
                print(loadedPerson)
                self.navigationItem.title = loadedPerson.name
                self.barbarId = loadedPerson.id ?? ""
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
    
    @objc func walletBtnTapped(sender: UIButton){
        let vc = storyboard?.instantiateViewController(identifier: "AddWalletViewController") as! AddWalletViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func ScheduleBtnTapped(sender: UIButton){
        let vc = storyboard?.instantiateViewController(identifier: "BookingViewController") as! BookingViewController
        vc.barbarId = self.barbarId
         self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func feedbackBtnTapped(sender: UIButton){
        let vc = storyboard?.instantiateViewController(identifier: "BarbarFeedbackViewController") as! BarbarFeedbackViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func logoutBtnTapped(sender: UIButton){
        UserDefaults.standard.set(false, forKey: loggedIn)
        UserDefaults.standard.set(nil, forKey: name)
        UserDefaults.standard.set(nil, forKey: userDic)
        let SB = UIStoryboard(name: "Main", bundle: nil)
        let VC = SB.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let NavController = UINavigationController(rootViewController: VC)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = NavController
    }
    
    
    
}
