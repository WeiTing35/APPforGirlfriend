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
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        }
}

