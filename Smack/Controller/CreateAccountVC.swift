//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Andrew Taylor on 13/09/2017.
//  Copyright © 2017 Andrew Taylor. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    //OUTLETS
    @IBOutlet var userEmailTxt: UITextField!
    @IBOutlet var usernameTXT: UITextField!
    @IBOutlet var passwordTxt: UITextField!
    @IBOutlet var userImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    
    @IBAction func createAccountPressed(_ sender: Any) {
        
        guard let email = userEmailTxt.text, userEmailTxt.text != "" else {return}
        guard let password = passwordTxt.text, passwordTxt.text != "" else {return}
        
        AuthService.instance.registerUsers(email: email, password: password) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: password, completion: { (success) in
                    if success {
                        print("Logged in user!", AuthService.instance.authToekn)
                    }
                })
            } else {
                print("Oh dear god")
            }
        }
    }
    
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
    }
    
    @IBAction func pickBgColorPressed(_ sender: Any) {
    }
    
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    

}
