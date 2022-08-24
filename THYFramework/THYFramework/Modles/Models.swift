//
//  Models.swift
//  THYFramework
//
//  Created by Tomer Har Yofi on 23/08/2022.
//

import Foundation
import UIKit

public class Event: NSObject, NSSecureCoding {
    private var eventType: EventType!
    private var timeStamp: Double!
    private var osVersion: String!
    
    public class var supportsSecureCoding: Bool { return true }

    public init(eventType:EventType, timeStamp:Double, osVersion:String) {
        super.init()
        self.eventType = eventType
        self.timeStamp = timeStamp
        self.osVersion = osVersion
    }
    
    //used for NSSecureCoding:
    public func encode(with coder: NSCoder) {
        coder.encode(eventType.rawValue, forKey: "eventType")
        coder.encode(timeStamp, forKey: "timeStamp")
        coder.encode(osVersion, forKey: "osVersion")
    }

    //used for NSSecureCoding:
    required public init?(coder: NSCoder) {
        super.init()
        self.eventType = EventType(rawValue:(coder.decodeObject(forKey: "eventType") as! String))
        self.timeStamp = (coder.decodeObject(forKey: "timeStamp") as! Double)
        self.osVersion = (coder.decodeObject(forKey: "osVersion") as! String)
    }
    
    public override var description: String {
        return "\nEvent: \(eventType.rawValue), TimeStamp: \(String(timeStamp)), OSVersion: \(String(osVersion))"
    }
}

public enum EventType: String {
    case navigate
    case click
}
