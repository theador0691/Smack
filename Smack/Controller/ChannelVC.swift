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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //saying that the rear view should take up everything eccept 60 points
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60

        
    }

    @IBAction func loginButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    
    

}
