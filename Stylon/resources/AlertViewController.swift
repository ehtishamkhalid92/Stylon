//
//  AlertViewController.swift
//  Stylon
//
//  Created by Muhammad Usman on 03/06/1441 AH.
//  Copyright © 1441 Macbook. All rights reserved.
//

import Foundation
import UIKit

class AlertViewController {
    static func showAlert (inViewController : UIViewController, title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(action)
        inViewController.present(alert,animated: true,completion: nil)
    }
}
