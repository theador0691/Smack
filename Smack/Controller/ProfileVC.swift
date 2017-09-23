//
//  ProfileVC.swift
//  Smack
//
//  Created by Andrew Taylor on 23/09/2017.
//  Copyright © 2017 Andrew Taylor. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    //outlets
    @IBOutlet var userName: UILabel!
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var userEmail: UILabel!
    @IBOutlet var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeModelPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func logOutPressed(_ sender: Any) {
        UserDataService.instance.logOutUsers()
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    func setupView(){
        userName.text = UserDataService.instance.name
        profileImage.image = UIImage(named: UserDataService.instance.avatarName)
        profileImage.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        userEmail.text = UserDataService.instance.email
        
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
    }
    
    @objc func closeTap(_ recogniser: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil )
        
    }
}
