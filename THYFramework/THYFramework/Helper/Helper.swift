//
//  Helper.swift
//  THYFramework
//
//  Created by Tomer Har Yofi on 23/08/2022.
//

import Foundation
import UIKit

class Helper {
    static func getDeviceOS() -> String {
        return  UIDevice.current.systemVersion
    }
    
    static func saveData(_ events:[Event]) {
           let archiver = NSKeyedArchiver(requiringSecureCoding: true)
           archiver.encode(events, forKey: "events")
           let data = archiver.encodedData
           try! data.write(to: URL(fileURLWithPath: dataFilePath()))
     }
    
    static func dataFilePath()-> String{
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        return paths.first!.appendingFormat("/events.plist")
    }
    
    static func loadData() -> [Event] {
        let path = self.dataFilePath()
        let defaultManager = FileManager()
        var eventsArray = [Event]()
        if defaultManager.fileExists(atPath: path) {
            let url = URL(fileURLWithPath: path)
            let data = try! Data(contentsOf: url)
            let unarchiver = try! NSKeyedUnarchiver(forReadingFrom: data)

            unarchiver.requiresSecureCoding = true

            unarchiver.setClass(Event.classForCoder(), forClassName: "parentModule.Event")
            let allowedClasses = [NSArray.classForCoder(),Event.classForCoder()]

            eventsArray = unarchiver.decodeObject(of: allowedClasses, forKey: "events") as! [Event]
            unarchiver.finishDecoding()
        }
        return eventsArray
    }
}
