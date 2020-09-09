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
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let userName = UserDefaults.standard.string(forKey: "userName"),let id = UserDefaults.standard.string(forKey: "id"){
            welcomeLabel.text = "Welcome, \(userName), with id \(id)"
        }
    }
    
    //to erase all login details when close button is tapped
    @IBAction func closeButtonTapped(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "userName")
        defaults.removeObject(forKey: "id")
        defaults.synchronize()
        dismiss(animated: true, completion: nil)
    }
    
}
