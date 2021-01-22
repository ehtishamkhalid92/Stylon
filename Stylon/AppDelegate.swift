//
//  AppDelegate.swift
//  Stylon
//
//  Created by Muhammad Usman on 17/05/1441 AH.
//  Copyright © 1441 Macbook. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import Firebase
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
       
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableDebugging = true
        IQKeyboardManager.shared.enableAutoToolbar = false
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        
        FirebaseApp.configure()
        
        let loginStatus = UserDefaults.standard.bool(forKey: loggedIn)
        print(loginStatus)
        if loginStatus == true {
            // Root view is Home Page
            var UserType = ""
            let defaults = UserDefaults.standard
            if let savedPerson = defaults.object(forKey: userDic) as? Data {
                let decoder = JSONDecoder()
                if let loadedPerson = try? decoder.decode(userModel.self, from: savedPerson) {
                    UserType = loadedPerson.userType ?? "-1"
                }
            }
            if UserType == "0" {
                // If it is the Babar
                let mainStoryboardIpad : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let VC : UIViewController = mainStoryboardIpad.instantiateViewController(withIdentifier: "BarbarViewController") as! BarbarViewController
                let navigationVc = UINavigationController(rootViewController: VC)
                self.window = UIWindow(frame: UIScreen.main.bounds)
                self.window?.rootViewController = navigationVc
                self.window?.makeKeyAndVisible()
            }
            else if UserType == "1" {
                // If it is the Simple User
                let mainStoryboardIpad : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let VC : UIViewController = mainStoryboardIpad.instantiateViewController(withIdentifier: "bookBarberViewController") as! bookBarberViewController
                let navigationVc = UINavigationController(rootViewController: VC)
                self.window = UIWindow(frame: UIScreen.main.bounds)
                self.window?.rootViewController = navigationVc
                self.window?.makeKeyAndVisible()
            }else {
                let mainStoryboardIpad : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let VC : UIViewController = mainStoryboardIpad.instantiateViewController(withIdentifier: "selcetViewController") as! selcetViewController
                let navigationVc = UINavigationController(rootViewController: VC)
                self.window = UIWindow(frame: UIScreen.main.bounds)
                self.window?.rootViewController = navigationVc
                self.window?.makeKeyAndVisible()
            }
        }else {
            // Root view is Login Page
            let mainStoryboardIpad : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let initialViewControlleripad : UIViewController = mainStoryboardIpad.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            let navigationVc = UINavigationController(rootViewController: initialViewControlleripad)
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.rootViewController = navigationVc
            self.window?.makeKeyAndVisible()
        }
        
        
        return true
    }

}

