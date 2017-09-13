//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Andrew Taylor on 13/09/2017.
//  Copyright © 2017 Andrew Taylor. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    

}
