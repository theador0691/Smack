//
//  ChatVC.swift
//  Smack
//
//  Created by Andrew Taylor on 11/09/2017.
//  Copyright © 2017 Andrew Taylor. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    //Outlets
    
    @IBOutlet var menuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //using the selector method from the swmreveal control file. Click comand on it to check it out!
        //showing the reveal view controler
        //for when you touch it!
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
       //adding two gesture recognisers that are already made in the supporting files!
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
    
    }





}
