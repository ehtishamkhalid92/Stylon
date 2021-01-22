//
//  AppointmentsViewController.swift
//  Stylon
//
//  Created by Macbook on 07/02/2020.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit
import Firebase
struct appointmetModel {
    let timeStampt : Double?
    let time : String?
}

class AppointmentsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var barbarId = ""
    lazy var appointmentArray = [appointmetModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAppointments()
    }
    
      private func getAppointments() {
        var userID = ""
        let defaults = UserDefaults.standard
        if let savedPerson = defaults.object(forKey: userDic) as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(userModel.self, from: savedPerson) {
                print(loadedPerson)
                userID = loadedPerson.id ?? ""
            }
        }
        
        let ref = Database.database().reference(withPath: "myAppointments").child(barbarId).child(userID)
          ref.observeSingleEvent(of: .value, with: { (snapshot) in
              if ( snapshot.value is NSNull ) {
                  print("not found") //didnt find it, ok to proceed
              } else {
                  for child in snapshot.children {
                    let snap = child as! DataSnapshot
                    let dict = snap.value as! [String: Any]
                    print(dict)
                    let timeStamp = dict["timeStamp"] as! Double
                    let timeSlot = dict["timeSlot"] as! String
                    let object = appointmetModel.init(timeStampt: timeStamp, time: timeSlot)
                    self.appointmentArray.append(object)
                  }
                self.tableView.reloadData()
                  
              }
          }) { (Error) in
              print(Error.localizedDescription)
          }
    
      }
    func getTimeComponentString(olderDate older: Date,newerDate newer: Date) -> (Int?)  {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full

        let componentsLeftTime = Calendar.current.dateComponents([.minute , .hour , .day,.month, .weekOfMonth,.year], from: older, to: newer)

//        let year = componentsLeftTime.year ?? 0
//        if  year > 0 {
//            formatter.allowedUnits = [.year]
//            return formatter.string(from: older, to: newer)
//        }
//
//
//        let month = componentsLeftTime.month ?? 0
//        if  month > 0 {
//            formatter.allowedUnits = [.month]
//            return formatter.string(from: older, to: newer)
//        }
//
//        let weekOfMonth = componentsLeftTime.weekOfMonth ?? 0
//        if  weekOfMonth > 0 {
//            formatter.allowedUnits = [.weekOfMonth]
//            return formatter.string(from: older, to: newer)
//        }
//
//        let day = componentsLeftTime.day ?? 0
//        if  day > 0 {
//            formatter.allowedUnits = [.day]
//            return formatter.string(from: older, to: newer)
//        }

        let hour = componentsLeftTime.hour ?? 0
        if  hour > 0 {
            formatter.allowedUnits = [.hour]
            let hour = formatter.string(from: older, to: newer)
            let encoded = hour?.components(separatedBy: " ")
            let passString: Int = Int((encoded?[0])!) ?? 0
            return passString
        }

//        let minute = componentsLeftTime.minute ?? 0
//        if  minute > 0 {
//            formatter.allowedUnits = [.minute]
//            return formatter.string(from: older, to: newer) ?? ""
//        }

        return 0
    }


}
extension AppointmentsViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appointmentArray.count
    }
    
    @objc func deleteBtnTapped(sender: UIButton) {
        var phoneNumber = ""
        let defaults = UserDefaults.standard
        if let savedPerson = defaults.object(forKey: userDic) as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(userModel.self, from: savedPerson) {
                print(loadedPerson)
                phoneNumber = loadedPerson.phone ?? ""
            }
        }
        
        
        let instance = appointmentArray[sender.tag]
        let timeStamp = instance.timeStampt ?? 0
        let olderDate = Date(timeIntervalSince1970: timeStamp / 1000)
        let newDate = Date()
        let difference = getTimeComponentString(olderDate: olderDate, newerDate: newDate) ?? 0
        if difference < 5 {
            
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
                    let newAmount = 500
                    let finalWalletAmount = previousAmount - newAmount
                    print("wallet amount",finalWalletAmount)
                    let body :[String:Any] = [
                        "wallet": "\(finalWalletAmount)"
                    ]
                    print(body)
                    ref.child(userId).updateChildValues(body, withCompletionBlock: { (Err, response) in
                        if Err == nil {
                            AlertViewController.showAlert(inViewController: self, title: name , message: "SucessFully Added")
                        }
                        
                    })
                }
            }) { (Error) in
                print(Error.localizedDescription)
            }
        }else {
            
        }
    }
    
    func deleteFunctionality () {
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! appointmentsTableViewCell
        let instance = appointmentArray[indexPath.row]
        cell.timeLbl.text = "Booking At \(instance.time ?? "")"
        let timeStamp = instance.timeStampt ?? 0
        let date = getDateFromTimeStamp(timeStamp: timeStamp)
        cell.dateLbl.text = "Date \(date)"
        cell.deleteBtn.tag = indexPath.row
        cell.deleteBtn.addTarget(self, action: #selector(deleteBtnTapped(sender:)), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
        func getDateFromTimeStamp(timeStamp : Double) -> String {

            let date = NSDate(timeIntervalSince1970: timeStamp / 1000)

            let dayTimePeriodFormatter = DateFormatter()
    //        dayTimePeriodFormatter.dateFormat = "dd MMM YY, hh:mm a"
         // UnComment below to get only time
          dayTimePeriodFormatter.dateFormat = "dd/MM/YYYY"

            let dateString = dayTimePeriodFormatter.string(from: date as Date)
            return dateString
        }
    
    
}
