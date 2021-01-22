//
//  BookingViewController.swift
//  Stylon
//
//  Created by Ehtisham Khalid on 08/02/2020.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit
import FSCalendar
import Firebase

class BookingViewController: UIViewController,FSCalendarDelegate {
    @IBOutlet weak var costViewHeight: NSLayoutConstraint!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var timeRequiredLbl: UILabel!
    @IBOutlet weak var totalCostLbl: UILabel!
    @IBOutlet weak var slotLbl: UILabel!
    @IBOutlet weak var calender: FSCalendar!
    @IBOutlet weak var hairCuttingBtn: UIButton!
    @IBOutlet weak var cuttingView: UIView!
    @IBOutlet weak var cuttingViewHeight: NSLayoutConstraint!
    @IBOutlet weak var facialBtn: UIButton!
    @IBOutlet weak var facialView: UIView!
    @IBOutlet weak var facialViewHeight: NSLayoutConstraint!
    @IBOutlet weak var hairColorBtn: UIButton!
    @IBOutlet weak var hairColorView: UIView!
    @IBOutlet weak var hairColorViewHeight: NSLayoutConstraint!
    @IBOutlet weak var unavialbleView: UIView!
    @IBOutlet weak var costView: UIView!
    @IBOutlet weak var cuttingHEadingLbl: UILabel!
    @IBOutlet weak var facialHeadingLbl: UILabel!
    @IBOutlet weak var hairColorLbl: UILabel!
    
    // Button actions view
    @IBOutlet weak var hairCuttingView: UIView!
    @IBOutlet weak var hairCuttingImg: UIImageView!
    
    @IBOutlet weak var khatView: UIView!
    @IBOutlet weak var khatImg: UIImageView!
    
    @IBOutlet weak var shaveView: UIView!
    @IBOutlet weak var shaveImg: UIImageView!
    
    @IBOutlet weak var cuttingColorServiceView: UIView!
    @IBOutlet weak var cuttingColorServiceImg: UIImageView!
    
    @IBOutlet weak var headMassageView: UIView!
    @IBOutlet weak var headMAssageImg: UIImageView!
    
    @IBOutlet weak var simpleCleansingView: UIView!
    @IBOutlet weak var simpleCleansingImg: UIImageView!
    
    @IBOutlet weak var doubleCleansingView: UIView!
    @IBOutlet weak var doubleCleansingImg: UIImageView!
    
    @IBOutlet weak var blackMAskView: UIView!
    @IBOutlet weak var blackMaskImg: UIImageView!
    
    @IBOutlet weak var headWashView: UIView!
    @IBOutlet weak var headWashImg: UIImageView!
    
    @IBOutlet weak var skinPolishView: UIView!
    @IBOutlet weak var skinPolishImg: UIImageView!
    
    @IBOutlet weak var garnierFacialView: UIView!
    @IBOutlet weak var garnierFacialImg: UIImageView!
    
    @IBOutlet weak var fansuiFacialView: UIView!
    @IBOutlet weak var fansuiFacialImg: UIImageView!
    
    @IBOutlet weak var jessicaFacialView: UIView!
    @IBOutlet weak var jessicaFacialImg: UIImageView!
    
    @IBOutlet weak var dermacosFacialView: UIView!
    @IBOutlet weak var dermacosFacialImg: UIImageView!
    
    @IBOutlet weak var singleCleansingView: UIView!
    @IBOutlet weak var singleCleansingImg: UIImageView!
    
    @IBOutlet weak var dermaClearView: UIView!
    @IBOutlet weak var dermaClearImg: UIImageView!
    
    @IBOutlet weak var janseenFacialView: UIView!
    @IBOutlet weak var janseenFacialImg: UIImageView!
    
    @IBOutlet weak var kenueView: UIView!
    @IBOutlet weak var kenueImg: UIImageView!
    
    @IBOutlet weak var vipHairView: UIView!
    @IBOutlet weak var vipHAirImg: UIImageView!
    
    @IBOutlet weak var hairTretmentView: UIView!
    @IBOutlet weak var hairTreatmentImg: UIImageView!
    
    @IBOutlet weak var keratinView: UIView!
    @IBOutlet weak var keratinImg: UIImageView!
    
    @IBOutlet weak var kenueReboundingview: UIView!
    @IBOutlet weak var kenueReboundingImg: UIImageView!
    
    @IBOutlet weak var vipStraightenerView: UIView!
    @IBOutlet weak var vipStraignerImg: UIImageView!
    
    @IBOutlet weak var lolanStraignerView: UIView!
    @IBOutlet weak var lolanStraignerImg: UIImageView!
    
    @IBOutlet weak var hairShinerView: UIView!
    @IBOutlet weak var hairShinerImg: UIImageView!
    
    @IBOutlet weak var dateBtn: UIButton!
    
    // bottom buttons
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var ten: UIButton!
    @IBOutlet weak var eleven: UIButton!
    @IBOutlet weak var twelve: UIButton!
    @IBOutlet weak var thirteen: UIButton!
    @IBOutlet weak var fourteen: UIButton!
    @IBOutlet weak var fifteen: UIButton!
    @IBOutlet weak var sixteen: UIButton!
    @IBOutlet weak var seventeen: UIButton!
    @IBOutlet weak var eighteen: UIButton!
    @IBOutlet weak var ninteen: UIButton!
    @IBOutlet weak var twenty: UIButton!
    @IBOutlet weak var twentyone: UIButton!
    @IBOutlet weak var twentyTwo: UIButton!
    @IBOutlet weak var twentyThree: UIButton!
    @IBOutlet weak var twentyFour: UIButton!
    @IBOutlet weak var twentyFive: UIButton!
    @IBOutlet weak var twentySix: UIButton!
    @IBOutlet weak var twentyEight: UIButton!
    @IBOutlet weak var twentyNine: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    
    lazy var BookedSlotArray = [String]()
    lazy var AlreadyBookedSlotArray = [String]()
    lazy var barbarId = ""
     var userType = ""
    var year : String?
    var Month: String?
    var day: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        if let savedPerson = defaults.object(forKey: userDic) as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(userModel.self, from: savedPerson) {
                print(loadedPerson)
                userType = loadedPerson.userType ?? ""
            }
        }
       
        one.greenShadowView()
        two.greenShadowView()
        three.greenShadowView()
        four.greenShadowView()
        five.greenShadowView()
        six.greenShadowView()
        seven.greenShadowView()
        eight.greenShadowView()
        nine.greenShadowView()
        ten.greenShadowView()
        eleven.greenShadowView()
        twelve.greenShadowView()
        thirteen.greenShadowView()
        fourteen.greenShadowView()
        fifteen.greenShadowView()
        sixteen.greenShadowView()
        seventeen.greenShadowView()
        eighteen.greenShadowView()
        ninteen.greenShadowView()
        twenty.greenShadowView()
        twentyone.greenShadowView()
        twentyTwo.greenShadowView()
        twentyThree.greenShadowView()
        twentyFour.greenShadowView()
        twentyFive.greenShadowView()
        twentySix.greenShadowView()
        twentyEight.greenShadowView()
        twentyNine.greenShadowView()
        one.addTarget(self, action: #selector(oneBtnTapped(sender:)), for: .touchUpInside)
        two.addTarget(self, action: #selector(twoBtnTapped(sender:)), for: .touchUpInside)
        three.addTarget(self, action: #selector(threeBtnTapped(sender:)), for: .touchUpInside)
        four.addTarget(self, action: #selector(fourBtnTapped(sender:)), for: .touchUpInside)
        five.addTarget(self, action: #selector(fiveBtnTapped(sender:)), for: .touchUpInside)
        six.addTarget(self, action: #selector(sixBtnTapped(sender:)), for: .touchUpInside)
        seven.addTarget(self, action: #selector(sevenBtnTapped(sender:)), for: .touchUpInside)
        eight.addTarget(self, action: #selector(eightBtnTapped(sender:)), for: .touchUpInside)
        nine.addTarget(self, action: #selector(nineBtnTapped(sender:)), for: .touchUpInside)
        ten.addTarget(self, action: #selector(tenBtnTapped(sender:)), for: .touchUpInside)
        eleven.addTarget(self, action: #selector(elevenBtnTapped(sender:)), for: .touchUpInside)
        twelve.addTarget(self, action: #selector(twelveBtnTapped(sender:)), for: .touchUpInside)
        thirteen.addTarget(self, action: #selector(thirteenBtnTapped(sender:)), for: .touchUpInside)
        fourteen.addTarget(self, action: #selector(fourteenBtnTapped(sender:)), for: .touchUpInside)
        fifteen.addTarget(self, action: #selector(fifteenBtnTapped(sender:)), for: .touchUpInside)
        sixteen.addTarget(self, action: #selector(sixteenBtnTapped(sender:)), for: .touchUpInside)
        
        seventeen.addTarget(self, action: #selector(seventeenBtnTapped(sender:)), for: .touchUpInside)
        eighteen.addTarget(self, action: #selector(eighteenBtnTapped(sender:)), for: .touchUpInside)
        ninteen.addTarget(self, action: #selector(ninteenBtnTapped(sender:)), for: .touchUpInside)
        twenty.addTarget(self, action: #selector(twentyBtnTapped(sender:)), for: .touchUpInside)
        twentyone.addTarget(self, action: #selector(twentyOneBtnTapped(sender:)), for: .touchUpInside)
        twentyTwo.addTarget(self, action: #selector(twentyTwoBtnTapped(sender:)), for: .touchUpInside)
        twentyThree.addTarget(self, action: #selector(twentyThreeBtnTapped(sender:)), for: .touchUpInside)
        twentyFour.addTarget(self, action: #selector(twentyFourBtnTapped(sender:)), for: .touchUpInside)
        twentyFive.addTarget(self, action: #selector(twentyFiveBtnTapped(sender:)), for: .touchUpInside)
        twentySix.addTarget(self, action: #selector(twentySixBtnTapped(sender:)), for: .touchUpInside)
        twentyEight.addTarget(self, action: #selector(twentySevenBtnTapped(sender:)), for: .touchUpInside)
        twentyNine.addTarget(self, action: #selector(twentyEightBtnTapped(sender:)), for: .touchUpInside)
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(hairCuttingTapped(sender: )))
        hairCuttingView.isUserInteractionEnabled = true
        hairCuttingView.addGestureRecognizer(tap)
        
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(KhatTapped(sender:)))
        khatView.isUserInteractionEnabled = true
        khatView.addGestureRecognizer(tap2)
        
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(ShaveTapped(sender:)))
        shaveView.isUserInteractionEnabled = true
        shaveView.addGestureRecognizer(tap3)
        
        let tap4 = UITapGestureRecognizer(target: self, action: #selector(cuttingColorServiceTapped(sender:)))
        cuttingColorServiceView.isUserInteractionEnabled = true
        cuttingColorServiceView.addGestureRecognizer(tap4)
        
        let tap5 = UITapGestureRecognizer(target: self, action: #selector(headMassageTapped(sender:)))
        headMassageView.isUserInteractionEnabled = true
        headMassageView.addGestureRecognizer(tap5)
        
        
        let tap6 = UITapGestureRecognizer(target: self, action: #selector(singleCleansingTapped(sender:)))
        simpleCleansingView.isUserInteractionEnabled = true
        simpleCleansingView.addGestureRecognizer(tap6)
        
        let tap7 = UITapGestureRecognizer(target: self, action: #selector(doubleCleansingTapped(sender:)))
        doubleCleansingView.isUserInteractionEnabled = true
        doubleCleansingView.addGestureRecognizer(tap7)
        
        let tap8 = UITapGestureRecognizer(target: self, action: #selector(BlackCleansingTapped(sender:)))
        blackMAskView.isUserInteractionEnabled = true
        blackMAskView.addGestureRecognizer(tap8)
        
        let tap9 = UITapGestureRecognizer(target: self, action: #selector(headWashTapped(sender:)))
        headWashView.isUserInteractionEnabled = true
        headWashView.addGestureRecognizer(tap9)
        
        // FOR FACIAL
        
        let tap10 = UITapGestureRecognizer(target: self, action: #selector(skinPolishTapped(sender:)))
        skinPolishView.isUserInteractionEnabled = true
        skinPolishView.addGestureRecognizer(tap10)
        
        
        let tap11 = UITapGestureRecognizer(target: self, action: #selector(garnierFacialTapped(sender:)))
        garnierFacialView.isUserInteractionEnabled = true
        garnierFacialView.addGestureRecognizer(tap11)
        
        let tap12 = UITapGestureRecognizer(target: self, action: #selector(fansuiTapped(sender:)))
        fansuiFacialView.isUserInteractionEnabled = true
        fansuiFacialView.addGestureRecognizer(tap12)
        
        let tap13 = UITapGestureRecognizer(target: self, action: #selector(jessicaTapped(sender:)))
        jessicaFacialView.isUserInteractionEnabled = true
        jessicaFacialView.addGestureRecognizer(tap13)
        
        let tap14 = UITapGestureRecognizer(target: self, action: #selector(dermacosTapped(sender:)))
        dermacosFacialView.isUserInteractionEnabled = true
        dermacosFacialView.addGestureRecognizer(tap14)
        
        
        let tap15 = UITapGestureRecognizer(target: self, action: #selector(singleFacialTapped(sender:)))
        singleCleansingView.isUserInteractionEnabled = true
        singleCleansingView.addGestureRecognizer(tap15)
        
        let tap16 = UITapGestureRecognizer(target: self, action: #selector(dermaClearTapped(sender:)))
        dermaClearView.isUserInteractionEnabled = true
        dermaClearView.addGestureRecognizer(tap16)
        
        let tap17 = UITapGestureRecognizer(target: self, action: #selector(janseenTapped(sender:)))
        janseenFacialView.isUserInteractionEnabled = true
        janseenFacialView.addGestureRecognizer(tap17)
        
        // hair color
        
        let tap18 = UITapGestureRecognizer(target: self, action: #selector(kenueColorTapped(sender:)))
        kenueView.isUserInteractionEnabled = true
        kenueView.addGestureRecognizer(tap18)
        
        
        let vipHAir = UITapGestureRecognizer(target: self, action: #selector(vipColorTapped(sender:)))
        vipHairView.isUserInteractionEnabled = true
        vipHairView.addGestureRecognizer(vipHAir)
        
        let hairTreatment = UITapGestureRecognizer(target: self, action: #selector(hairTreatmentTapped(sender:)))
        hairTretmentView.isUserInteractionEnabled = true
        hairTretmentView.addGestureRecognizer(hairTreatment)
        
        let keratin = UITapGestureRecognizer(target: self, action: #selector(keratinTapped(sender:)))
        keratinView.isUserInteractionEnabled = true
        keratinView.addGestureRecognizer(keratin)
        
        let kenue = UITapGestureRecognizer(target: self, action: #selector(kenueReboundingTapped(sender:)))
        kenueReboundingview.isUserInteractionEnabled = true
        kenueReboundingview.addGestureRecognizer(kenue)
        
        
        let vip = UITapGestureRecognizer(target: self, action: #selector(vipStraighnerTapped(sender:)))
        vipStraightenerView.isUserInteractionEnabled = true
        vipStraightenerView.addGestureRecognizer(vip)
        
        let lolan = UITapGestureRecognizer(target: self, action: #selector(lolanStraighnerTapped(sender:)))
        lolanStraignerView.isUserInteractionEnabled = true
        lolanStraignerView.addGestureRecognizer(lolan)
        
        let shiner = UITapGestureRecognizer(target: self, action: #selector(hairShinerTapped(sender:)))
        hairShinerView.isUserInteractionEnabled = true
        hairShinerView.addGestureRecognizer(shiner)
        
        
        
        dateBtn.addTarget(self, action: #selector(showDatePicker(sender:)), for: .touchUpInside)
        
        cuttingHEadingLbl.shadowView()
        hairColorLbl.shadowView()
        facialHeadingLbl.shadowView()
        costView.isHidden = true
        costViewHeight.constant = 0
        cuttingView.isHidden = true
        cuttingViewHeight.constant = 0 // total 911
        hairColorView.isHidden = true
        hairColorViewHeight.constant = 0 // intial 820
        facialView.isHidden = true
        facialViewHeight.constant = 0 // 930
        
        calender.scope = .week
        calender.adjustsBoundingRectWhenChangingMonths = true
        calender.shadowView()
        
        let todayDate = NSDate()
        let currentDate = "\(todayDate)"
        let encodedDate = currentDate.components(separatedBy: " ")
        let toCovertStringDate = encodedDate[0]
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd/MM/yyyy"
        
        if let date = dateFormatterGet.date(from: "\(toCovertStringDate)") {
            print(dateFormatterPrint.string(from: date))
            let showDate = dateFormatterPrint.string(from: date)
            dateBtn.setTitle(showDate, for: .normal)
            let components = Calendar.current.dateComponents([.year, .month, .day], from: date)
            if let day = components.day, let month = components.month, let year = components.year {
                print("\(day) \(month) \(year)")
                let date = "\(day)/\(month)/\(year)"
                self.dateBtn.setTitle(date, for: .normal)
                
                self.year = "\(year)"
                self.Month = "\(month)"
                self.day = "\(day)"
                getAlreadyAllocatedSlotsData(year: self.year!, month: self.Month!, day: self.day!)
            }
        } else {
            print("There was an error decoding the string")
        }
        
        hairCuttingBtn.addTarget(self, action: #selector(cuttingBtnTapped(sender:)), for: .touchUpInside)
        hairColorBtn.addTarget(self, action: #selector(colorBtnTapped(sender:)), for: .touchUpInside)
        facialBtn.addTarget(self, action: #selector(facialBtnTapped(sender:)), for: .touchUpInside)
        
        saveBtn.addTarget(self, action: #selector(saveBtnTapped(sender:)), for: .touchUpInside)
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
    
    @objc func cuttingBtnTapped(sender: UIButton) {
        if cuttingViewHeight.constant == 0 {
            cuttingViewHeight.constant = 911
            cuttingView.isHidden = false
        }else {
            cuttingViewHeight.constant = 0
            cuttingView.isHidden = true
        }
    }
    
    @objc func colorBtnTapped(sender: UIButton) {
        if hairColorViewHeight.constant == 0 {
            hairColorViewHeight.constant = 820
            hairColorView.isHidden = false
        }else {
            hairColorViewHeight.constant = 0
            hairColorView.isHidden = true
        }
    }
    @objc func facialBtnTapped(sender: UIButton) {
        if facialViewHeight.constant == 0 {
            facialViewHeight.constant = 930
            facialView.isHidden = false
        }else {
            facialViewHeight.constant = 0
            facialView.isHidden = true
        }
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let currentDate = "\(date)"
        let encodedDate = currentDate.components(separatedBy: " ")
        let toCovertStringDate = encodedDate[0]
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"
        
        if let date = dateFormatterGet.date(from: "\(toCovertStringDate)") {
            print(dateFormatterPrint.string(from: date))
            self.dateLbl.text = dateFormatterPrint.string(from: date)
        } else {
            print("There was an error decoding the string")
        }
    }
    
    
    private func addToServer() {
        let timeStamp = Date().toMillis()
        var userID = ""
        let defaults = UserDefaults.standard
        if let savedPerson = defaults.object(forKey: userDic) as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(userModel.self, from: savedPerson) {
                print(loadedPerson)
                userID = loadedPerson.id ?? ""
            }
        }
        let ref = Database.database().reference()
        let key = ref.childByAutoId().key!
        
        if self.BookedSlotArray.count > 0 {
            for item in self.BookedSlotArray {
                let timeSlot = item
                let body:[String:Any] = [
                    "appointmentByUserId": userID,
                    "appointmentTimeStamp": timeStamp!,
                    "id": key,
                    "timeSlot":timeSlot]
                
                let encodedTime = timeSlot.components(separatedBy: ":")
                let hour = encodedTime[0]
                let encodeDate = encodedTime[1].components(separatedBy: " ")
                let minutes = encodeDate[0]
                let timzone = encodeDate[1]
                let param:[String:Any] = [
                    "day": self.day!,
                    "hour": hour,
                    "id": key,
                    "minute": minutes,
                    "month": self.Month!,
                    "timeSlot":timeSlot,
                    "timeStamp": timeStamp!,
                    "timeZone":timzone,
                    "year":self.year!
                    
                ]
                print(param)
                print(body)
                ref.child("barbers").child(barbarId).child("barberSchedule").child(self.year!).child(self.Month!).child(self.day!).child(key).updateChildValues(body) { (Err, response) in
                    if Err == nil {
                        
                    }
                }
                
                ref.child("myAppointments").child(barbarId).child(userID).child(key).updateChildValues(param) { (Err, response) in
                    if Err == nil {
                        AlertViewController.showAlert(inViewController: self, title: "Taqwim", message: "Slot Reserved Sucessfully")
                    }
                }
                
                
            }
        }
        
    }
    
    @objc func showDatePicker(sender:UIButton) {
        let datePicker = UIDatePicker()//Date picker
        datePicker.datePickerMode = .date
        let datePickerSize = CGSize(width: 320, height: 216) //Date picker size
        datePicker.frame = CGRect(x: 0, y: 0, width: datePickerSize.width, height: datePickerSize.height)
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        
        let popoverView = UIView()
        popoverView.backgroundColor = UIColor.clear
        popoverView.addSubview(datePicker)
        // here you can add tool bar with done and cancel buttons if required
        
        let popoverViewController = UIViewController()
        popoverViewController.view = popoverView
        popoverViewController.view.frame = CGRect(x: 0, y: 0, width: datePickerSize.width, height: datePickerSize.height)
        popoverViewController.modalPresentationStyle = .popover
        popoverViewController.preferredContentSize = datePickerSize
        popoverViewController.popoverPresentationController?.sourceView = sender // source button
        popoverViewController.popoverPresentationController?.sourceRect = sender.bounds // source button bounds
        popoverViewController.popoverPresentationController?.delegate = self // to handle popover delegate methods
        self.present(popoverViewController, animated: true, completion: nil)
        
    }
    @objc func dateChanged(_ datePicker: UIDatePicker) {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: datePicker.date)
        if let day = components.day, let month = components.month, let year = components.year {
            print("\(day) \(month) \(year)")
            let date = "\(day)/\(month)/\(year)"
            self.dateBtn.setTitle(date, for: .normal)
            
            self.year = "\(year)"
            self.Month = "\(month)"
            self.day = "\(day)"
            getAlreadyAllocatedSlotsData(year: self.year!, month: self.Month!, day: self.day!)
        }
    }
    
    @objc func saveBtnTapped(sender:UIButton){
        if userType == "0" {
            addToServer()
        }else{
            let totalCount = self.BookedSlotArray.count
                   if totalSlots == totalCount {
                       addToServer()
                   }else {
                       AlertViewController.showAlert(inViewController: self, title: "Taqwim", message: "Please select required slots or service")
                   }
        }
       
    }
    
    private func getAlreadyAllocatedSlotsData(year: String ,month:String , day:String ) {
        self.AlreadyBookedSlotArray.removeAll()
        self.BookedSlotArray.removeAll()
        let ref = Database.database().reference(withPath: "barbers").child(barbarId).child("barberSchedule").child(year).child(month).child(day)
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            if ( snapshot.value is NSNull ) {
                print("not found") //didnt find it, ok to proceed
                self.bookedSlotSetup()
            } else {
                for child in snapshot.children {
                    let snap = child as! DataSnapshot
                    let dict = snap.value as! [String: Any]
                    print(dict)
                    let timeSlot = dict["timeSlot"] as! String
                    self.AlreadyBookedSlotArray.append(timeSlot)
                }
                print(self.AlreadyBookedSlotArray)
                self.bookedSlotSetup()
            }
        }) { (Error) in
            print(Error.localizedDescription)
        }
    }
    
    private func setupSlot() {
        if totalTime < 30 {
            totalSlots = 1
        }else if totalTime > 30 && totalTime < 60 {
            totalSlots = 2
        }else if totalTime > 60 && totalTime < 90 {
            totalSlots = 3
        }else if totalTime > 90 && totalTime < 120 {
            totalSlots = 4
        }else if totalTime > 120 && totalTime < 150 {
            totalSlots = 5
        }else if totalTime > 150 && totalTime < 180 {
            totalSlots = 6
        }else if totalTime > 210 && totalTime < 240 {
            totalSlots = 7
        }else if totalTime > 240 && totalTime < 270 {
            totalSlots = 8
        }else if totalTime > 270 && totalTime < 300 {
            totalSlots = 9
        }else if totalTime > 300 && totalTime < 330 {
            totalSlots = 10
        }else if totalTime > 330 && totalTime < 360 {
            totalSlots = 11
        }else if totalTime > 360 && totalTime < 390 {
            totalSlots = 12
        }else if totalTime > 390 && totalTime < 420 {
            totalSlots = 13
        }else if totalTime > 420 && totalTime < 460 {
            totalSlots = 14
        }else if totalTime > 460 && totalTime < 490 {
            totalSlots = 15
        }else if totalTime > 490 && totalTime < 520 {
            totalSlots = 16
        }else if totalTime > 520 && totalTime < 550 {
            totalSlots = 17
        }else if totalTime > 550 && totalTime < 580 {
            totalSlots = 18
        }else if totalTime > 580 && totalTime < 610 {
            totalSlots = 19
        }else if totalTime > 610 && totalTime < 640 {
            totalSlots = 20
        }else if totalTime > 640 && totalTime < 670 {
            totalSlots = 21
        }else if totalTime > 670 && totalTime < 700 {
            totalSlots = 22
        }else if totalTime > 700 && totalTime < 730 {
            totalSlots = 23
        }else if totalTime > 730 && totalTime < 770 {
            totalSlots = 24
        }
        slotLbl.text = "\(totalSlots) slots needed"
    }
    
    private func bookedSlotSetup() {
        one.greenShadowView()
        two.greenShadowView()
        three.greenShadowView()
        four.greenShadowView()
        five.greenShadowView()
        six.greenShadowView()
        seven.greenShadowView()
        eight.greenShadowView()
        nine.greenShadowView()
        ten.greenShadowView()
        eleven.greenShadowView()
        twelve.greenShadowView()
        thirteen.greenShadowView()
        fourteen.greenShadowView()
        fifteen.greenShadowView()
        sixteen.greenShadowView()
        seventeen.greenShadowView()
        eighteen.greenShadowView()
        ninteen.greenShadowView()
        twenty.greenShadowView()
        twentyone.greenShadowView()
        twentyTwo.greenShadowView()
        twentyThree.greenShadowView()
        twentyFour.greenShadowView()
        twentyFive.greenShadowView()
        twentySix.greenShadowView()
        twentyEight.greenShadowView()
        twentyNine.greenShadowView()
        
        one.isUserInteractionEnabled = true
        two.isUserInteractionEnabled = true
        three.isUserInteractionEnabled = true
        four.isUserInteractionEnabled = true
        five.isUserInteractionEnabled = true
        six.isUserInteractionEnabled = true
        seven.isUserInteractionEnabled = true
        eight.isUserInteractionEnabled = true
        nine.isUserInteractionEnabled = true
        ten.isUserInteractionEnabled = true
        eleven.isUserInteractionEnabled = true
        twelve.isUserInteractionEnabled = true
        thirteen.isUserInteractionEnabled = true
        fourteen.isUserInteractionEnabled = true
        fifteen.isUserInteractionEnabled = true
        sixteen.isUserInteractionEnabled = true
        seventeen.isUserInteractionEnabled = true
        eighteen.isUserInteractionEnabled = true
        ninteen.isUserInteractionEnabled = true
        twenty.isUserInteractionEnabled = true
        twentyone.isUserInteractionEnabled = true
        twentyTwo.isUserInteractionEnabled = true
        twentyThree.isUserInteractionEnabled = true
        twentyFour.isUserInteractionEnabled = true
        twentyFive.isUserInteractionEnabled = true
        twentySix.isUserInteractionEnabled = true
        twentyEight.isUserInteractionEnabled = true
        twentyNine.isUserInteractionEnabled = true
        if AlreadyBookedSlotArray.count > 0 {
            for item in AlreadyBookedSlotArray {
                if item == "10:00 AM" {
                    one.redShadowView()
                    one.isUserInteractionEnabled = false
                }else if item == "10:30 AM" {
                    two.redShadowView()
                    two.isUserInteractionEnabled = false
                }else if item == "11:00 AM" {
                    three.redShadowView()
                    three.isUserInteractionEnabled = false
                }else if item == "11:30 AM" {
                    four.redShadowView()
                    four.isUserInteractionEnabled = false
                }else if item == "12:00 AM" {
                    five.redShadowView()
                    five.isUserInteractionEnabled = false
                }else if item == "12:30 AM" {
                    six.redShadowView()
                    six.isUserInteractionEnabled = false
                }else if item == "01:00 PM" {
                    seven.redShadowView()
                    seven.isUserInteractionEnabled = false
                }else if item == "01:30 PM" {
                    eight.redShadowView()
                    eight.isUserInteractionEnabled = false
                }else if item == "02:00 PM" {
                    nine.redShadowView()
                    nine.isUserInteractionEnabled = false
                }else if item == "02:30 PM" {
                    ten.redShadowView()
                    ten.isUserInteractionEnabled = false
                }else if item == "03:00 PM" {
                    eleven.redShadowView()
                    eleven.isUserInteractionEnabled = false
                }else if item == "03:30 PM" {
                    twelve.redShadowView()
                    twelve.isUserInteractionEnabled = false
                }else if item == "04:00 PM" {
                    thirteen.redShadowView()
                    thirteen.isUserInteractionEnabled = false
                }else if item == "04:30 PM" {
                    fourteen.redShadowView()
                    fourteen.isUserInteractionEnabled = false
                }else if item == "05:00 PM" {
                    fifteen.redShadowView()
                    fifteen.isUserInteractionEnabled = false
                }else if item == "05:30 PM" {
                    sixteen.redShadowView()
                    sixteen.isUserInteractionEnabled = false
                }else if item == "06:00 PM" {
                    seventeen.redShadowView()
                    seventeen.isUserInteractionEnabled = false
                }else if item == "06:30 PM" {
                    eighteen.redShadowView()
                    eighteen.isUserInteractionEnabled = false
                }else if item == "07:00 PM" {
                    ninteen.redShadowView()
                    ninteen.isUserInteractionEnabled = false
                }else if item == "07:30 PM" {
                    twenty.redShadowView()
                    twenty.isUserInteractionEnabled = false
                }else if item == "08:00 PM" {
                    twentyone.redShadowView()
                    twentyone.isUserInteractionEnabled = false
                }else if item == "08:30 PM" {
                    twentyTwo.redShadowView()
                    twentyTwo.isUserInteractionEnabled = false
                }else if item == "09:00 PM" {
                    twentyThree.redShadowView()
                    twentyThree.isUserInteractionEnabled = false
                }else if item == "09:30 PM" {
                    twentyFour.redShadowView()
                    twentyFour.isUserInteractionEnabled = false
                }else if item == "10:00 PM" {
                    twentyFive.redShadowView()
                    twentyFive.isUserInteractionEnabled = false
                }else if item == "10:30 PM" {
                    twentySix.redShadowView()
                    twentySix.isUserInteractionEnabled = false
                }else if item == "11:00 PM" {
                    twentyEight.redShadowView()
                    twentyEight.isUserInteractionEnabled = false
                }else if item == "11:30 PM" {
                    twentyNine.redShadowView()
                    twentyNine.isUserInteractionEnabled = false
                }else {
                    print("Not Found")
                }
            }
        }
    }
    
    //MARK:- Slot Action
    var oneStatus = false
    @objc func oneBtnTapped(sender: UIButton) {
        if oneStatus == false {
            sender.redShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.append(title)
        }else {
            sender.greenShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.removeFirst { $0 == title }
        }
        oneStatus = !oneStatus
        print(BookedSlotArray)
    }
    
    var twoStatus = false
    @objc func twoBtnTapped(sender: UIButton) {
        if twoStatus == false {
            sender.redShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.append(title)
        }else {
            sender.greenShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.removeFirst { $0 == title }
        }
        twoStatus = !twoStatus
        print(BookedSlotArray)
    }
    
    var threeStatus = false
    @objc func threeBtnTapped(sender: UIButton) {
        if threeStatus == false {
            sender.redShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.append(title)
        }else {
            sender.greenShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.removeFirst { $0 == title }
        }
        threeStatus = !threeStatus
        print(BookedSlotArray)
    }
    
    var fourStatus = false
    @objc func fourBtnTapped(sender: UIButton) {
        if fourStatus == false {
            sender.redShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.append(title)
        }else {
            sender.greenShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.removeFirst { $0 == title }
        }
        fourStatus = !fourStatus
        print(BookedSlotArray)
    }
    
    var fiveStatus = false
    @objc func fiveBtnTapped(sender: UIButton) {
        if fiveStatus == false {
            sender.redShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.append(title)
        }else {
            sender.greenShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.removeFirst { $0 == title }
        }
        fiveStatus = !fiveStatus
        print(BookedSlotArray)
    }
    
    var sixStatus = false
    @objc func sixBtnTapped(sender: UIButton) {
        if sixStatus == false {
            sender.redShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.append(title)
        }else {
            sender.greenShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.removeFirst { $0 == title }
        }
        sixStatus = !sixStatus
        print(BookedSlotArray)
    }
    
    var sevenStatus = false
    @objc func sevenBtnTapped(sender: UIButton) {
        if sevenStatus == false {
            sender.redShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.append(title)
        }else {
            sender.greenShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.removeFirst { $0 == title }
        }
        sevenStatus = !sevenStatus
        print(BookedSlotArray)
    }
    
    var eightStatus = false
    @objc func eightBtnTapped(sender: UIButton) {
        if eightStatus == false {
            sender.redShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.append(title)
        }else {
            sender.greenShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.removeFirst { $0 == title }
        }
        eightStatus = !eightStatus
        print(BookedSlotArray)
    }
    
    var nineStatus = false
    @objc func nineBtnTapped(sender: UIButton) {
        if nineStatus == false {
            sender.redShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.append(title)
        }else {
            sender.greenShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.removeFirst { $0 == title }
        }
        nineStatus = !nineStatus
        print(BookedSlotArray)
    }
    
    var tenStatus = false
    @objc func tenBtnTapped(sender: UIButton) {
        if tenStatus == false {
            sender.redShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.append(title)
        }else {
            sender.greenShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.removeFirst { $0 == title }
        }
        tenStatus = !tenStatus
        print(BookedSlotArray)
    }
    
    var ekevenStatus = false
    @objc func elevenBtnTapped(sender: UIButton) {
        if ekevenStatus == false {
            sender.redShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.append(title)
        }else {
            sender.greenShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.removeFirst { $0 == title }
        }
        ekevenStatus = !ekevenStatus
        print(BookedSlotArray)
    }
    
    var twelveStatus = false
    @objc func twelveBtnTapped(sender: UIButton) {
        if twelveStatus == false {
            sender.redShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.append(title)
        }else {
            sender.greenShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.removeFirst { $0 == title }
        }
        twelveStatus = !twelveStatus
        print(BookedSlotArray)
    }
    
    var thirteenStatus = false
    @objc func thirteenBtnTapped(sender: UIButton) {
        if thirteenStatus == false {
            sender.redShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.append(title)
        }else {
            sender.greenShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.removeFirst { $0 == title }
        }
        thirteenStatus = !thirteenStatus
        print(BookedSlotArray)
    }
    
    var fourteenStatus = false
    @objc func fourteenBtnTapped(sender: UIButton) {
        if fourteenStatus == false {
            sender.redShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.append(title)
        }else {
            sender.greenShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.removeFirst { $0 == title }
        }
        fourteenStatus = !fourteenStatus
        print(BookedSlotArray)
    }
    
    var fifteenStatus = false
    @objc func fifteenBtnTapped(sender: UIButton) {
        if fifteenStatus == false {
            sender.redShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.append(title)
        }else {
            sender.greenShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.removeFirst { $0 == title }
        }
        fifteenStatus = !fifteenStatus
        print(BookedSlotArray)
    }
    
    var sixteenStatus = false
    @objc func sixteenBtnTapped(sender: UIButton) {
        if sixteenStatus == false {
            sender.redShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.append(title)
        }else {
            sender.greenShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.removeFirst { $0 == title }
        }
        sixteenStatus = !sixteenStatus
        print(BookedSlotArray)
    }
    
    var seventeenStatus = false
    @objc func seventeenBtnTapped(sender: UIButton) {
        if seventeenStatus == false {
            sender.redShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.append(title)
        }else {
            sender.greenShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.removeFirst { $0 == title }
        }
        seventeenStatus = !seventeenStatus
        print(BookedSlotArray)
    }
    
    var eighteenStatus = false
    @objc func eighteenBtnTapped(sender: UIButton) {
        if eighteenStatus == false {
            sender.redShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.append(title)
        }else {
            sender.greenShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.removeFirst { $0 == title }
        }
        eighteenStatus = !eighteenStatus
        print(BookedSlotArray)
    }
    
    var ninteenStatus = false
    @objc func ninteenBtnTapped(sender: UIButton) {
        if ninteenStatus == false {
            sender.redShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.append(title)
        }else {
            sender.greenShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.removeFirst { $0 == title }
        }
        ninteenStatus = !ninteenStatus
        print(BookedSlotArray)
    }
    
    var twentyStatus = false
    @objc func twentyBtnTapped(sender: UIButton) {
        if twentyStatus == false {
            sender.redShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.append(title)
        }else {
            sender.greenShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.removeFirst { $0 == title }
        }
        twentyStatus = !twentyStatus
        print(BookedSlotArray)
    }
    
    var twentyOneStatus = false
    @objc func twentyOneBtnTapped(sender: UIButton) {
        if twentyOneStatus == false {
            sender.redShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.append(title)
        }else {
            sender.greenShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.removeFirst { $0 == title }
        }
        twentyOneStatus = !twentyOneStatus
        print(BookedSlotArray)
    }
    
    var twentyTwoStatus = false
    @objc func twentyTwoBtnTapped(sender: UIButton) {
        if twentyTwoStatus == false {
            sender.redShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.append(title)
        }else {
            sender.greenShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.removeFirst { $0 == title }
        }
        twentyTwoStatus = !twentyTwoStatus
        print(BookedSlotArray)
    }
    
    var twentyThreeStatus = false
    @objc func twentyThreeBtnTapped(sender: UIButton) {
        if twentyThreeStatus == false {
            sender.redShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.append(title)
        }else {
            sender.greenShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.removeFirst { $0 == title }
        }
        twentyThreeStatus = !twentyThreeStatus
        print(BookedSlotArray)
    }
    
    var twentyFourStatus = false
    @objc func twentyFourBtnTapped(sender: UIButton) {
        if twentyFourStatus == false {
            sender.redShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.append(title)
        }else {
            sender.greenShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.removeFirst { $0 == title }
        }
        twentyFourStatus = !twentyFourStatus
        print(BookedSlotArray)
    }
    
    var twentyFiveStatus = false
    @objc func twentyFiveBtnTapped(sender: UIButton) {
        if twentyFiveStatus == false {
            sender.redShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.append(title)
        }else {
            sender.greenShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.removeFirst { $0 == title }
        }
        twentyFiveStatus = !twentyFiveStatus
        print(BookedSlotArray)
    }
    
    var twentySixStatus = false
    @objc func twentySixBtnTapped(sender: UIButton) {
        if twentySixStatus == false {
            sender.redShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.append(title)
        }else {
            sender.greenShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.removeFirst { $0 == title }
        }
        twentySixStatus = !twentySixStatus
        print(BookedSlotArray)
    }
    
    var twentySevenStatus = false
    @objc func twentySevenBtnTapped(sender: UIButton) {
        if twentySevenStatus == false {
            sender.redShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.append(title)
        }else {
            sender.greenShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.removeFirst { $0 == title }
        }
        twentySevenStatus = !twentySevenStatus
        print(BookedSlotArray)
    }
    
    var twentyEightStatus = false
    @objc func twentyEightBtnTapped(sender: UIButton) {
        if twentyEightStatus == false {
            sender.redShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.append(title)
        }else {
            sender.greenShadowView()
            let title =  sender.titleLabel?.text! ?? ""
            BookedSlotArray.removeFirst { $0 == title }
        }
        twentyEightStatus = !twentyEightStatus
        print(BookedSlotArray)
    }
    
    
    
    //MARK:- Item Selection Actions
    
    var TotalAmount = 0
    var totalTime = 0
    var totalSlots = 0
    
    var hairCuttingStatus = false
    @objc func hairCuttingTapped(sender: UITapGestureRecognizer) {
        costViewHeight.constant = 100
        costView.isHidden = false
        
        if hairCuttingStatus == false {
            hairCuttingImg.image = #imageLiteral(resourceName: "doubletick")
            let time = totalTime + 20
            totalTime = time
            let Amount = TotalAmount + 150
            TotalAmount = Amount
        }else {
            hairCuttingImg.image = nil
            let time = totalTime - 20
            totalTime = time
            let Amount = TotalAmount - 150
            TotalAmount = Amount
        }
        hairCuttingStatus = !hairCuttingStatus
        if totalTime > 0 {
            timeRequiredLbl.text = "Time Required \(totalTime) Mins"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        if TotalAmount > 0 {
            totalCostLbl.text = "Total Cost Rs. \(TotalAmount)"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        
        setupSlot()
    }
    
    var KhatStatus = false
    @objc func KhatTapped(sender: UITapGestureRecognizer) {
        costViewHeight.constant = 100
        costView.isHidden = false
        
        if KhatStatus == false {
            khatImg.image = #imageLiteral(resourceName: "doubletick")
            let time = totalTime + 20
            totalTime = time
            let Amount = TotalAmount + 150
            TotalAmount = Amount
        }else {
            khatImg.image = nil
            let time = totalTime - 20
            totalTime = time
            let Amount = TotalAmount - 150
            TotalAmount = Amount
        }
        KhatStatus = !KhatStatus
        if totalTime > 0 {
            timeRequiredLbl.text = "Time Required \(totalTime) Mins"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        if TotalAmount > 0 {
            totalCostLbl.text = "Total Cost Rs. \(TotalAmount)"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        setupSlot()
    }
    
    var ShaveStatus = false
    @objc func ShaveTapped(sender: UITapGestureRecognizer) {
        costViewHeight.constant = 100
        costView.isHidden = false
        
        if ShaveStatus == false {
            shaveImg.image = #imageLiteral(resourceName: "doubletick")
            let time = totalTime + 10
            totalTime = time
            let Amount = TotalAmount + 100
            TotalAmount = Amount
        }else {
            shaveImg.image = nil
            let time = totalTime - 10
            totalTime = time
            let Amount = TotalAmount - 100
            TotalAmount = Amount
        }
        ShaveStatus = !ShaveStatus
        if totalTime > 0 {
            timeRequiredLbl.text = "Time Required \(totalTime) Mins"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        if TotalAmount > 0 {
            totalCostLbl.text = "Total Cost Rs. \(TotalAmount)"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        setupSlot()
    }
    
    var cuttingColarServiceStatus = false
    @objc func cuttingColorServiceTapped(sender: UITapGestureRecognizer) {
        costViewHeight.constant = 100
        costView.isHidden = false
        
        if cuttingColarServiceStatus == false {
            cuttingColorServiceImg.image = #imageLiteral(resourceName: "doubletick")
            let time = totalTime + 15
            totalTime = time
            let Amount = TotalAmount + 500
            TotalAmount = Amount
        }else {
            cuttingColorServiceImg.image = nil
            let time = totalTime - 15
            totalTime = time
            let Amount = TotalAmount - 500
            TotalAmount = Amount
        }
        cuttingColarServiceStatus = !cuttingColarServiceStatus
        if totalTime > 0 {
            timeRequiredLbl.text = "Time Required \(totalTime) Mins"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        if TotalAmount > 0 {
            totalCostLbl.text = "Total Cost Rs. \(TotalAmount)"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        setupSlot()
    }
    
    var headMassageStatus = false
    @objc func headMassageTapped(sender: UITapGestureRecognizer) {
        costViewHeight.constant = 100
        costView.isHidden = false
        
        if headMassageStatus == false {
            headMAssageImg.image = #imageLiteral(resourceName: "doubletick")
            let time = totalTime + 15
            totalTime = time
            let Amount = TotalAmount + 200
            TotalAmount = Amount
        }else {
            headMAssageImg.image = nil
            let time = totalTime - 15
            totalTime = time
            let Amount = TotalAmount - 200
            TotalAmount = Amount
        }
        headMassageStatus = !headMassageStatus
        if totalTime > 0 {
            timeRequiredLbl.text = "Time Required \(totalTime) Mins"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        if TotalAmount > 0 {
            totalCostLbl.text = "Total Cost Rs. \(TotalAmount)"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        setupSlot()
    }
    
    var simpleCleansingStatus = false
    @objc func singleCleansingTapped(sender: UITapGestureRecognizer) {
        costViewHeight.constant = 100
        costView.isHidden = false
        
        if simpleCleansingStatus == false {
            simpleCleansingImg.image = #imageLiteral(resourceName: "doubletick")
            let time = totalTime + 15
            totalTime = time
            let Amount = TotalAmount + 300
            TotalAmount = Amount
        }else {
            simpleCleansingImg.image = nil
            let time = totalTime - 15
            totalTime = time
            let Amount = TotalAmount - 300
            TotalAmount = Amount
        }
        simpleCleansingStatus = !simpleCleansingStatus
        if totalTime > 0 {
            timeRequiredLbl.text = "Time Required \(totalTime) Mins"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        if TotalAmount > 0 {
            totalCostLbl.text = "Total Cost Rs. \(TotalAmount)"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        setupSlot()
    }
    
    var doubleCleansingStatus = false
    @objc func doubleCleansingTapped(sender: UITapGestureRecognizer) {
        costViewHeight.constant = 100
        costView.isHidden = false
        
        if doubleCleansingStatus == false {
            doubleCleansingImg.image = #imageLiteral(resourceName: "doubletick")
            let time = totalTime + 15
            totalTime = time
            let Amount = TotalAmount + 600
            TotalAmount = Amount
        }else {
            doubleCleansingImg.image = nil
            let time = totalTime - 15
            totalTime = time
            let Amount = TotalAmount - 600
            TotalAmount = Amount
        }
        doubleCleansingStatus = !doubleCleansingStatus
        if totalTime > 0 {
            timeRequiredLbl.text = "Time Required \(totalTime) Mins"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        if TotalAmount > 0 {
            totalCostLbl.text = "Total Cost Rs. \(TotalAmount)"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        setupSlot()
    }
    
    var blackMaskStatus = false
    @objc func BlackCleansingTapped(sender: UITapGestureRecognizer) {
        costViewHeight.constant = 100
        costView.isHidden = false
        
        if blackMaskStatus == false {
            blackMaskImg.image = #imageLiteral(resourceName: "doubletick")
            let time = totalTime + 15
            totalTime = time
            let Amount = TotalAmount + 150
            TotalAmount = Amount
        }else {
            blackMaskImg.image = nil
            let time = totalTime - 15
            totalTime = time
            let Amount = TotalAmount - 150
            TotalAmount = Amount
        }
        blackMaskStatus = !blackMaskStatus
        if totalTime > 0 {
            timeRequiredLbl.text = "Time Required \(totalTime) Mins"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        if TotalAmount > 0 {
            totalCostLbl.text = "Total Cost Rs. \(TotalAmount)"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        setupSlot()
    }
    
    var haedWashStatus = false
    @objc func headWashTapped(sender: UITapGestureRecognizer) {
        costViewHeight.constant = 100
        costView.isHidden = false
        
        if haedWashStatus == false {
            headWashImg.image = #imageLiteral(resourceName: "doubletick")
            let time = totalTime + 15
            totalTime = time
            let Amount = TotalAmount + 100
            TotalAmount = Amount
        }else {
            headWashImg.image = nil
            let time = totalTime - 15
            totalTime = time
            let Amount = TotalAmount - 100
            TotalAmount = Amount
        }
        haedWashStatus = !haedWashStatus
        if totalTime > 0 {
            timeRequiredLbl.text = "Time Required \(totalTime) Mins"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        if TotalAmount > 0 {
            totalCostLbl.text = "Total Cost Rs. \(TotalAmount)"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        setupSlot()
    }
    
    // FOR FACIAL
    
    var skinPolishStatus = false
    @objc func skinPolishTapped(sender: UITapGestureRecognizer) {
        costViewHeight.constant = 100
        costView.isHidden = false
        
        if skinPolishStatus == false {
            skinPolishImg.image = #imageLiteral(resourceName: "doubletick")
            let time = totalTime + 30
            totalTime = time
            let Amount = TotalAmount + 1000
            TotalAmount = Amount
        }else {
            skinPolishImg.image = nil
            let time = totalTime - 30
            totalTime = time
            let Amount = TotalAmount - 1000
            TotalAmount = Amount
        }
        skinPolishStatus = !skinPolishStatus
        if totalTime > 0 {
            timeRequiredLbl.text = "Time Required \(totalTime) Mins"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        if TotalAmount > 0 {
            totalCostLbl.text = "Total Cost Rs. \(TotalAmount)"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        
        setupSlot()
    }
    
    var garnierFacialStatus = false
    @objc func garnierFacialTapped(sender: UITapGestureRecognizer) {
        costViewHeight.constant = 100
        costView.isHidden = false
        
        if garnierFacialStatus == false {
            garnierFacialImg.image = #imageLiteral(resourceName: "doubletick")
            let time = totalTime + 45
            totalTime = time
            let Amount = TotalAmount + 1500
            TotalAmount = Amount
        }else {
            garnierFacialImg.image = nil
            let time = totalTime - 45
            totalTime = time
            let Amount = TotalAmount - 1500
            TotalAmount = Amount
        }
        garnierFacialStatus = !garnierFacialStatus
        if totalTime > 0 {
            timeRequiredLbl.text = "Time Required \(totalTime) Mins"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        if TotalAmount > 0 {
            totalCostLbl.text = "Total Cost Rs. \(TotalAmount)"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        setupSlot()
    }
    
    var fansuiStatus = false
    @objc func fansuiTapped(sender: UITapGestureRecognizer) {
        costViewHeight.constant = 100
        costView.isHidden = false
        
        if fansuiStatus == false {
            fansuiFacialImg.image = #imageLiteral(resourceName: "doubletick")
            let time = totalTime + 45
            totalTime = time
            let Amount = TotalAmount + 2000
            TotalAmount = Amount
        }else {
            fansuiFacialImg.image = nil
            let time = totalTime - 45
            totalTime = time
            let Amount = TotalAmount - 2000
            TotalAmount = Amount
        }
        fansuiStatus = !fansuiStatus
        if totalTime > 0 {
            timeRequiredLbl.text = "Time Required \(totalTime) Mins"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        if TotalAmount > 0 {
            totalCostLbl.text = "Total Cost Rs. \(TotalAmount)"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        setupSlot()
    }
    
    var jessicaStatus = false
    @objc func jessicaTapped(sender: UITapGestureRecognizer) {
        costViewHeight.constant = 100
        costView.isHidden = false
        
        if jessicaStatus == false {
            jessicaFacialImg.image = #imageLiteral(resourceName: "doubletick")
            let time = totalTime + 45
            totalTime = time
            let Amount = TotalAmount + 2500
            TotalAmount = Amount
        }else {
            jessicaFacialImg.image = nil
            let time = totalTime - 45
            totalTime = time
            let Amount = TotalAmount - 2500
            TotalAmount = Amount
        }
        jessicaStatus = !jessicaStatus
        if totalTime > 0 {
            timeRequiredLbl.text = "Time Required \(totalTime) Mins"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        if TotalAmount > 0 {
            totalCostLbl.text = "Total Cost Rs. \(TotalAmount)"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        setupSlot()
    }
    
    var dermocasStatus = false
    @objc func dermacosTapped(sender: UITapGestureRecognizer) {
        costViewHeight.constant = 100
        costView.isHidden = false
        
        if dermocasStatus == false {
            dermacosFacialImg.image = #imageLiteral(resourceName: "doubletick")
            let time = totalTime + 45
            totalTime = time
            let Amount = TotalAmount + 3000
            TotalAmount = Amount
        }else {
            dermacosFacialImg.image = nil
            let time = totalTime - 45
            totalTime = time
            let Amount = TotalAmount - 3000
            TotalAmount = Amount
        }
        dermocasStatus = !dermocasStatus
        if totalTime > 0 {
            timeRequiredLbl.text = "Time Required \(totalTime) Mins"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        if TotalAmount > 0 {
            totalCostLbl.text = "Total Cost Rs. \(TotalAmount)"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        setupSlot()
    }
    
    var singleFacialStatus = false
    @objc func singleFacialTapped(sender: UITapGestureRecognizer) {
        costViewHeight.constant = 100
        costView.isHidden = false
        
        if singleFacialStatus == false {
            singleCleansingImg.image = #imageLiteral(resourceName: "doubletick")
            let time = totalTime + 15
            totalTime = time
            let Amount = TotalAmount + 300
            TotalAmount = Amount
        }else {
            singleCleansingImg.image = nil
            let time = totalTime - 15
            totalTime = time
            let Amount = TotalAmount - 300
            TotalAmount = Amount
        }
        singleFacialStatus = !singleFacialStatus
        if totalTime > 0 {
            timeRequiredLbl.text = "Time Required \(totalTime) Mins"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        if TotalAmount > 0 {
            totalCostLbl.text = "Total Cost Rs. \(TotalAmount)"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        setupSlot()
    }
    
    var dermaClearStatus = false
    @objc func dermaClearTapped(sender: UITapGestureRecognizer) {
        costViewHeight.constant = 100
        costView.isHidden = false
        
        if dermaClearStatus == false {
            dermaClearImg.image = #imageLiteral(resourceName: "doubletick")
            let time = totalTime + 45
            totalTime = time
            let Amount = TotalAmount + 5000
            TotalAmount = Amount
        }else {
            dermaClearImg.image = nil
            let time = totalTime - 45
            totalTime = time
            let Amount = TotalAmount - 5000
            TotalAmount = Amount
        }
        dermaClearStatus = !dermaClearStatus
        if totalTime > 0 {
            timeRequiredLbl.text = "Time Required \(totalTime) Mins"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        if TotalAmount > 0 {
            totalCostLbl.text = "Total Cost Rs. \(TotalAmount)"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        setupSlot()
    }
    
    var janseenStatus = false
    @objc func janseenTapped(sender: UITapGestureRecognizer) {
        costViewHeight.constant = 100
        costView.isHidden = false
        
        if janseenStatus == false {
            janseenFacialImg.image = #imageLiteral(resourceName: "doubletick")
            let time = totalTime + 45
            totalTime = time
            let Amount = TotalAmount + 3000
            TotalAmount = Amount
        }else {
            janseenFacialImg.image = nil
            let time = totalTime - 45
            totalTime = time
            let Amount = TotalAmount - 3000
            TotalAmount = Amount
        }
        janseenStatus = !janseenStatus
        if totalTime > 0 {
            timeRequiredLbl.text = "Time Required \(totalTime) Mins"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        if TotalAmount > 0 {
            totalCostLbl.text = "Total Cost Rs. \(TotalAmount)"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        setupSlot()
    }
    
    // for hair color
    var kenueColorStatus = false
    @objc func kenueColorTapped(sender: UITapGestureRecognizer) {
        costViewHeight.constant = 100
        costView.isHidden = false
        
        if kenueColorStatus == false {
            kenueImg.image = #imageLiteral(resourceName: "doubletick")
            let time = totalTime + 20
            totalTime = time
            let Amount = TotalAmount + 1000
            TotalAmount = Amount
        }else {
            kenueImg.image = nil
            let time = totalTime - 20
            totalTime = time
            let Amount = TotalAmount - 1000
            TotalAmount = Amount
        }
        kenueColorStatus = !kenueColorStatus
        if totalTime > 0 {
            timeRequiredLbl.text = "Time Required \(totalTime) Mins"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        if TotalAmount > 0 {
            totalCostLbl.text = "Total Cost Rs. \(TotalAmount)"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        
        setupSlot()
    }
    
    var vipColorStatus = false
    @objc func vipColorTapped(sender: UITapGestureRecognizer) {
        costViewHeight.constant = 100
        costView.isHidden = false
        
        if vipColorStatus == false {
            vipHAirImg.image = #imageLiteral(resourceName: "doubletick")
            let time = totalTime + 20
            totalTime = time
            let Amount = TotalAmount + 800
            TotalAmount = Amount
        }else {
            vipHAirImg.image = nil
            let time = totalTime - 20
            totalTime = time
            let Amount = TotalAmount - 800
            TotalAmount = Amount
        }
        vipColorStatus = !vipColorStatus
        if totalTime > 0 {
            timeRequiredLbl.text = "Time Required \(totalTime) Mins"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        if TotalAmount > 0 {
            totalCostLbl.text = "Total Cost Rs. \(TotalAmount)"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        setupSlot()
    }
    
    var hairTreatmentStatus = false
    @objc func hairTreatmentTapped(sender: UITapGestureRecognizer) {
        costViewHeight.constant = 100
        costView.isHidden = false
        
        if hairTreatmentStatus == false {
            hairTreatmentImg.image = #imageLiteral(resourceName: "doubletick")
            let time = totalTime + 30
            totalTime = time
            let Amount = TotalAmount + 1500
            TotalAmount = Amount
        }else {
            hairTreatmentImg.image = nil
            let time = totalTime - 30
            totalTime = time
            let Amount = TotalAmount - 1500
            TotalAmount = Amount
        }
        hairTreatmentStatus = !hairTreatmentStatus
        if totalTime > 0 {
            timeRequiredLbl.text = "Time Required \(totalTime) Mins"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        if TotalAmount > 0 {
            totalCostLbl.text = "Total Cost Rs. \(TotalAmount)"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        setupSlot()
    }
    
    var keratinStatus = false
    @objc func keratinTapped(sender: UITapGestureRecognizer) {
        costViewHeight.constant = 100
        costView.isHidden = false
        
        if keratinStatus == false {
            keratinImg.image = #imageLiteral(resourceName: "doubletick")
            let time = totalTime + 120
            totalTime = time
            let Amount = TotalAmount + 6000
            TotalAmount = Amount
        }else {
            keratinImg.image = nil
            let time = totalTime - 120
            totalTime = time
            let Amount = TotalAmount - 6000
            TotalAmount = Amount
        }
        keratinStatus = !keratinStatus
        if totalTime > 0 {
            timeRequiredLbl.text = "Time Required \(totalTime) Mins"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        if TotalAmount > 0 {
            totalCostLbl.text = "Total Cost Rs. \(TotalAmount)"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        setupSlot()
    }
    
    var kenueReboundingStatus = false
    @objc func kenueReboundingTapped(sender: UITapGestureRecognizer) {
        costViewHeight.constant = 100
        costView.isHidden = false
        
        if kenueReboundingStatus == false {
            kenueReboundingImg.image = #imageLiteral(resourceName: "doubletick")
            let time = totalTime + 120
            totalTime = time
            let Amount = TotalAmount + 5000
            TotalAmount = Amount
        }else {
            kenueReboundingImg.image = nil
            let time = totalTime - 120
            totalTime = time
            let Amount = TotalAmount - 5000
            TotalAmount = Amount
        }
        kenueReboundingStatus = !kenueReboundingStatus
        if totalTime > 0 {
            timeRequiredLbl.text = "Time Required \(totalTime) Mins"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        if TotalAmount > 0 {
            totalCostLbl.text = "Total Cost Rs. \(TotalAmount)"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        setupSlot()
    }
    
    var vipStraighnerStatus = false
    @objc func vipStraighnerTapped(sender: UITapGestureRecognizer) {
        costViewHeight.constant = 100
        costView.isHidden = false
        
        if vipStraighnerStatus == false {
            vipStraignerImg.image = #imageLiteral(resourceName: "doubletick")
            let time = totalTime + 45
            totalTime = time
            let Amount = TotalAmount + 2000
            TotalAmount = Amount
        }else {
            vipStraignerImg.image = nil
            let time = totalTime - 45
            totalTime = time
            let Amount = TotalAmount - 2000
            TotalAmount = Amount
        }
        vipStraighnerStatus = !vipStraighnerStatus
        if totalTime > 0 {
            timeRequiredLbl.text = "Time Required \(totalTime) Mins"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        if TotalAmount > 0 {
            totalCostLbl.text = "Total Cost Rs. \(TotalAmount)"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        setupSlot()
    }
    
    var lolanStraighnerStatus = false
    @objc func lolanStraighnerTapped(sender: UITapGestureRecognizer) {
        costViewHeight.constant = 100
        costView.isHidden = false
        
        if lolanStraighnerStatus == false {
            doubleCleansingImg.image = #imageLiteral(resourceName: "doubletick")
            let time = totalTime + 45
            totalTime = time
            let Amount = TotalAmount + 2000
            TotalAmount = Amount
        }else {
            doubleCleansingImg.image = nil
            let time = totalTime - 45
            totalTime = time
            let Amount = TotalAmount - 2000
            TotalAmount = Amount
        }
        lolanStraighnerStatus = !lolanStraighnerStatus
        if totalTime > 0 {
            timeRequiredLbl.text = "Time Required \(totalTime) Mins"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        if TotalAmount > 0 {
            totalCostLbl.text = "Total Cost Rs. \(TotalAmount)"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        setupSlot()
    }
    
    var hairShinerStatus = false
    @objc func hairShinerTapped(sender: UITapGestureRecognizer) {
        costViewHeight.constant = 100
        costView.isHidden = false
        
        if hairShinerStatus == false {
            hairShinerImg.image = #imageLiteral(resourceName: "doubletick")
            let time = totalTime + 25
            totalTime = time
            let Amount = TotalAmount + 500
            TotalAmount = Amount
        }else {
            hairShinerImg.image = nil
            let time = totalTime - 25
            totalTime = time
            let Amount = TotalAmount - 500
            TotalAmount = Amount
        }
        hairShinerStatus = !hairShinerStatus
        if totalTime > 0 {
            timeRequiredLbl.text = "Time Required \(totalTime) Mins"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        if TotalAmount > 0 {
            totalCostLbl.text = "Total Cost Rs. \(TotalAmount)"
        }else {
            costViewHeight.constant = 0
            costView.isHidden = true
        }
        setupSlot()
    }
    
    
    
    
    
}

extension BookingViewController : UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        // Force popover style
        return UIModalPresentationStyle.none
    }
}
extension Date {
    func toMillis() -> Int64! {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
}
