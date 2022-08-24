//
//  Logger.swift
//  THYFramework
//
//  Created by Tomer Har Yofi on 23/08/2022.
//

import Foundation
import UIKit

public class Logger {
    
    // static property to create singleton
    static public let shared = Logger()
    var logger = [Event]()
    
    private init() {
        //add swizzle to screen change and button click
        UIViewController.swizzlingPresent()
        UIViewController.swizzlingDismiss()
        UIButton.swizzlingTouchesEnded()
    }
    
    public func logEvent(eventType: EventType){
        let event = Event(eventType: eventType,
                          timeStamp: NSDate().timeIntervalSince1970,
                          osVersion: Helper.getDeviceOS())
        logger.append(event)
        printEvent(event: event)
        
        //save to device memory
        Helper.saveData(logger)
    }
    
    private func printEvent(event: Event) {
        print(event.description)
    }
}
