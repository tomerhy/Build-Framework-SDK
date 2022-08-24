//
//  UIButton.swift
//  THYFramework
//
//  Created by Tomer Har Yofi on 23/08/2022.
//

import UIKit
import Foundation

extension UIButton {
    
    static func swizzlingTouchesEnded() {
        
        let originalSelector = #selector(UIButton.touchesEnded(_:with:))
        let swizzledSelector = #selector(UIButton.swizzledTouchesEnded(_:with:))
        
        let originalMethod = class_getInstanceMethod(self, originalSelector)
        let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
        method_exchangeImplementations(originalMethod!, swizzledMethod!)
    }
    
    @objc func swizzledTouchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        swizzledTouchesEnded(touches, with: event)
        //print(#function)
        Logger.shared.logEvent(eventType: .click)
    }
}
