//
//  AvatarCell.swift
//  Smack
//
//  Created by Andrew Taylor on 17/09/2017.
//  Copyright © 2017 Andrew Taylor. All rights reserved.
//

import UIKit

enum AvatarType {
    case light
    case dark
}

class AvatarCell: UICollectionViewCell {
    @IBOutlet var avatarImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func configureCell(index: Int, type: AvatarType) {
        if type == .dark {
            avatarImage.image = UIImage(named: "dark\(index)")
            self.layer.backgroundColor = UIColor.lightGray.cgColor
        }else{
            avatarImage.image = UIImage(named: "light\(index)")
            self.layer.backgroundColor = UIColor.gray.cgColor

        }
    }
    
    func setupView() {
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
    
}
