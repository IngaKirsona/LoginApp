//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Inga Kirsona on 08/09/2020.
//  Copyright © 2020 Inga Kirsona. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    
  //  var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let userName = UserDefaults.standard.string(forKey: "userName"),let id = UserDefaults.standard.string(forKey: "id"){
            welcomeLabel.text = "Welcome, \(userName), with id \(id)"
        }
    }
    

    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
