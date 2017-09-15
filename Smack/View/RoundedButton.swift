//
//  RoundedButton.swift
//  Smack
//
//  Created by Andrew Taylor on 15/09/2017.
//  Copyright © 2017 Andrew Taylor. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 3.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    
    func setUpView() {
        self.layer.cornerRadius = cornerRadius
    }
    
    override func prepareForInterfaceBuilder() {
        super .prepareForInterfaceBuilder()
        self.setUpView()
    }
    
    override func awakeFromNib() {
        self.setUpView()
    }
    
    

}
