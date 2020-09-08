//
//  ViewController.swift
//  LoginApp
//
//  Created by Inga Kirsona on 08/09/2020.
//  Copyright © 2020 Inga Kirsona. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: DesignableTextField!
    @IBOutlet weak var passwordTextField: DesignableTextField!
    
    private let userName = "inga"
    private let id = "2020"
    private let identifier = "WelcomeViewController"
    
    let notificationCenter = NotificationCenter.default
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: Notification){
        if self.view.frame.origin.y == 0{
            self.view.frame.origin.y -= 150
        }
    }
    @objc func keyboardWillHide(notification: Notification){
        if self.view.frame.origin.y != 0{
            self.view.frame.origin.y += 150
        }
    }
    
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        guard  userNameTextField.text ==  userName, passwordTextField.text == id else {
            warningPopUP(withTitle: "Invalid login!", withMessage: "Please enter correct username and password!")
            return
        }
        goToWelcomeVC()
    }
    //pass the text through storyboard with our id
    func goToWelcomeVC(){
        let initController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: identifier) as! WelcomeViewController
        
        initController.userName = userNameTextField.text
        view.endEditing(true)
        present(initController, animated: true)
    }
    
    @IBAction func forgotUserTapped(_ sender: Any) {
        warningPopUP(withTitle: "Oooops!", withMessage: "Your username is \(userName)")
    }
    
    @IBAction func forgotPasswordTapped(_ sender: Any) {
        warningPopUP(withTitle: "Oooops!", withMessage: "Your password is \(id)")
    }
    //to hide the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    
}

