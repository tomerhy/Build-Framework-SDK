//
//  ViewController.swift
//  THY_Interview_app
//
//  Created by Interview on 23/08/2022.
//

import UIKit
import THY_SDK

class MainViewController: UIViewController {
    
    let main = UIStoryboard(name: "Main", bundle:Bundle.main)
    
    @IBAction func detailsViewControllerClicked(_ sender: Any) {
        guard let detailsVC = main.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else {
            return
        }
        
        self.present(detailsVC, animated: true)
    }
}

