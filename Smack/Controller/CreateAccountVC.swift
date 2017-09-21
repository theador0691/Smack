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
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    //variables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    var bgColour: UIColor?
    
    
    override func viewDidLoad() {
        setupView()
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            userImg.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
            if avatarName.contains("light") && bgColour == nil {
                userImg.backgroundColor = UIColor.lightGray
            }
        }
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        //starting the spinner to spin!
        spinner.isHidden = false
        spinner.startAnimating()
        
        guard let name = usernameTXT.text, usernameTXT.text != "" else {return}
        guard let email = userEmailTxt.text, userEmailTxt.text != "" else {return}
        guard let password = passwordTxt.text, passwordTxt.text != "" else {return}
        
        AuthService.instance.registerUsers(email: email, password: password) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: password, completion: { (success) in
                    if success {
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, complition: { (success) in
                            if success{
                                //stop the spinner
                                self.spinner.isHidden = true
                                self.spinner.stopAnimating()
                                print(UserDataService.instance.name)
                                print(UserDataService.instance.avatarName)
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
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
        let r = CGFloat(arc4random_uniform(255)) / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        let b = CGFloat(arc4random_uniform(255)) / 255
        bgColour = UIColor(red: r, green: g, blue: b, alpha: 1)
        
        UIView.animate(withDuration: 0.2) {
            self.userImg.backgroundColor = self.bgColour
        }
        
    }
    
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    func setupView() {
        spinner.isHidden = true
        usernameTXT.attributedText = NSAttributedString(string: "username", attributes: [NSAttributedStringKey.foregroundColor:SMACK_PURPLE_PLACEHOLDER])
        userEmailTxt.attributedText = NSAttributedString(string: "email", attributes: [NSAttributedStringKey.foregroundColor:SMACK_PURPLE_PLACEHOLDER])
        passwordTxt.attributedText = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor:SMACK_PURPLE_PLACEHOLDER])
        
        //handel when you tap away
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.handelTap))
        view.addGestureRecognizer(tap)

    }

    
    
    //end editing function
    @objc func handelTap(){
        view.endEditing(true)
    }
    
}
