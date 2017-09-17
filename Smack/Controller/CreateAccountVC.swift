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
    
    //variables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            userImg.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
        }
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        guard let name = usernameTXT.text, usernameTXT.text != "" else {return}
        guard let email = userEmailTxt.text, userEmailTxt.text != "" else {return}
        guard let password = passwordTxt.text, passwordTxt.text != "" else {return}
        
        AuthService.instance.registerUsers(email: email, password: password) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: password, completion: { (success) in
                    if success {
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, complition: { (success) in
                            if success{
                                print(UserDataService.instance.name)
                                print(UserDataService.instance.avatarName)
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                            }
                        })
                        
                    }
                })
            } else {
                print("Oh dear god")
            }
        }
    }
    
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func pickBgColorPressed(_ sender: Any) {
    }
    
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    

}
