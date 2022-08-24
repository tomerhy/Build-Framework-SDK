//
//  DetailsViewController.swift
//  THY_Interview_app
//
//  Created by Interview on 23/08/2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    
    @IBAction func backToMainViewControllerClicked(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func HellowWorldClicked(_ sender: Any) {
        showHellowWorldAlert()
    }
    
    func showHellowWorldAlert() {
        // create the alert
        let alert = UIAlertController(title: "Please Hire ME! \nTomer Har Yoffi", message: "Hellow World", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
}
