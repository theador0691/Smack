//
//  ChannelVC.swift
//  Smack
//
//  Created by Andrew Taylor on 11/09/2017.
//  Copyright © 2017 Andrew Taylor. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    //Outlets
   //need to have an outlet to change it when the user is logged in
    @IBOutlet var loginButton: UIButton!
    @IBAction func prepare(for segue: UIStoryboardSegue){}
    
    @IBOutlet var userImage: CircleImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        //saying that the rear view should take up everything eccept 60 points
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        
        //observer
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)

        
    }

    @objc func userDataDidChange(_ notfi: Notification) {
        if AuthService.instance.isLoggedIn {
            loginButton.setTitle(UserDataService.instance.name, for: .normal)
            userImage.image = UIImage(named: UserDataService.instance.avatarName)
            userImage.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        } else {
            loginButton.setTitle("LogIn", for: .normal)
            userImage.image = UIImage(named: "menuProfileIcon")
            userImage.backgroundColor = UIColor.clear
        }
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    
    

}
