//
//  WalletViewController.swift
//  Stylon
//
//  Created by Muhammad Usman on 26/05/1441 AH.
//  Copyright © 1441 Macbook. All rights reserved.
//

import UIKit

class WalletViewController: UIViewController {
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var PriceLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        if let savedPerson = defaults.object(forKey: userDic) as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(userModel.self, from: savedPerson) {
                PriceLbl.text = "PKR " + (loadedPerson.wallet ?? "")
                nameLbl.text = loadedPerson.name
            }
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
