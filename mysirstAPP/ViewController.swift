//
//  ViewController.swift
//  mysirstAPP
//
//  Created by Wei on 2020/1/23.
//  Copyright © 2020 Wei. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createNotification()
        
    }

    @IBAction func showMessage(sender: UIButton) {
      
        let formatter = DateFormatter()
         formatter.dateFormat = "YYYYMMdd"
         let endDate = formatter.date(from: "20190228")

         // 當前日期 - 考試日期
//         let date = Date()
         let days = -Date().daysBetweenDate(toDate: endDate!)
//         print("相差天數爲 ==", days)

         let alertController = UIAlertController(title: "交往天數", message: "第 " + String(days) + " 天 🤟", preferredStyle: UIAlertController.Style.alert)
        
     
        
         alertController.addAction(UIAlertAction(title: " ♥♥♥ OK ♥♥♥ ", style: .destructive, handler: nil))
            
         present(alertController, animated: true, completion: nil)
               
    
    }
    
    func createNotification() {
            
            let content = UNMutableNotificationContent()
            
            content.title = "想念提醒"
            content.subtitle = "楊捷羽"
            content.body = "記得要想我～～～"
            content.badge = 1
            content.sound = UNNotificationSound.default
            content.categoryIdentifier = "alarmMessage"
            
        
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

//        let date = datePicker.date
//        let calendar = Calendar.current
//        let components = calendar.dateComponents([ .hour, .minute],
//            from: date)
//        let trigger = UNCalendarNotificationTrigger(dateMatching:
//            components, repeats: true)
        
//        let content = UNMutableNotificationContent()
//        content.body = "溫蒂要下班了，要準備出門買點心接送她"
        
        
        // 定义触发的时间组合
        var matchingDate = DateComponents()
        matchingDate.hour = 12
        matchingDate.minute = 03

        let trigger = UNCalendarNotificationTrigger(    dateMatching: matchingDate,
                                                            repeats: true)
        // *** 参数说明 ***
        // dateMatching     : 触发通知的时间组合 DateComponents
        // repeats          : 是否重复 true/false

        
        
        let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)

//        let request = UNNotificationRequest(identifier:
//            "notification1", content: content, trigger: trigger)
//        UNUserNotificationCenter.current().add(request,
//             withCompletionHandler: nil)
            
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        }
}

