//
//  AvatarCell.swift
//  Smack
//
//  Created by Andrew Taylor on 17/09/2017.
//  Copyright © 2017 Andrew Taylor. All rights reserved.
//

import UIKit

class AvatarCell: UICollectionViewCell {
    @IBOutlet var avatarImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    
    func setupView() {
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
    
}
