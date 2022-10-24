//
//  NotificationCenter.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 9.10.22.
//

import Foundation
import UserNotifications

class NotificationCenter: NSObject {
    let localNotification = UNUserNotificationCenter.current()
    func notification() {
        localNotification.requestAuthorization(options: [.alert,.sound, .badge]) { (granted, error) in
            
            guard granted else { return }
            self.localNotification.getNotificationSettings { (settings) in
                print(settings)
                guard settings.authorizationStatus == .authorized else { return }
            }
        }
        
        localNotification.delegate = self
        
    }
    func sendNotifications(title: String, body: String, date: Date) {
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        let gregorian = Calendar(identifier: Calendar.Identifier.gregorian)
        let dateComponents = gregorian.dateComponents([.month, .day, .hour, .minute, .year], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        
        let notificationRequest = UNNotificationRequest(identifier: UUID().uuidString,
                                                        content: content,
                                                        trigger: trigger)
        localNotification.add(notificationRequest) { (error) in
            //print(error?.localizedDescription)
        }
    }
    func removeLocalNotificationCenter() {
        localNotification.removeAllDeliveredNotifications()
        localNotification.removeAllPendingNotificationRequests()
        print("remove Notification")
    }
    
}
extension NotificationCenter: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
        print(#function)
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print(#function)
    }
    
    
}
/*
let gregorian = Calendar(identifier: Calendar.Identifier.gregorian)

let dateComponents = DateComponents(calendar: gregorian,
                                    timeZone: nil,
                                    era: nil,
                                    year: nil,
                                    month: nil,
                                    day: nil,
                                    hour: localNotification.hour,
                                    minute: localNotification.minute,
                                    second: nil,
                                    nanosecond: nil,
                                    weekday: localNotification.weekday,
                                    weekdayOrdinal: nil,
                                    quarter: nil,
                                    weekOfMonth: nil,
                                    weekOfYear: nil,
                                    yearForWeekOfYear: nil)
let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

let notificationRequest = UNNotificationRequest(identifier: localNotification.identifier,
                                                content: content,
                                                trigger: trigger)
*/
