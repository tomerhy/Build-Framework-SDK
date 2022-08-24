//
//  UIViewController.swift
//  
//
//  Created by Tomer Har Yofi on 23/08/2022.
//

import UIKit
import Foundation

extension UIViewController {
    
    static func swizzlingPresent() {
        
        let originalSelector = #selector(UIViewController.present(_:animated:completion:))
        let swizzledSelector = #selector(UIViewController.swizzledPresent(_:animated:completion:))
        
        let originalMethod = class_getInstanceMethod(self, originalSelector)
        let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
        method_exchangeImplementations(originalMethod!, swizzledMethod!)
    }
    
    static func swizzlingDismiss() {
        
        let originalSelector = #selector(UIViewController.dismiss(animated:completion:))
        let swizzledSelector = #selector(UIViewController.swizzledDismiss(animated:completion:))
        
        let originalMethod = class_getInstanceMethod(self, originalSelector)
        let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
        method_exchangeImplementations(originalMethod!, swizzledMethod!)
    }
    
    @objc func swizzledPresent(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        swizzledPresent(viewControllerToPresent, animated: flag, completion:completion)
        //print(#function)
        Logger.shared.logEvent(eventType: .navigate)
    }
    
    @objc func swizzledDismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        swizzledDismiss(animated: flag, completion:completion)
        //print(#function)
        Logger.shared.logEvent(eventType: .navigate)
    }
}
