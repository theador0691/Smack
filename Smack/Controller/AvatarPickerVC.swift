//
//  AvatarPickerVC.swift
//  Smack
//
//  Created by Andrew Taylor on 17/09/2017.
//  Copyright © 2017 Andrew Taylor. All rights reserved.
//

import UIKit

class AvatarPickerVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    //outlets
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var segmentControll: UISegmentedControl!
    
    override func viewDidLoad() {
        collectionView.delegate = self
        collectionView.dataSource = self
    
        super.viewDidLoad()

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "avatarCell", for: indexPath) as? AvatarCell{
            return cell
        }else {
            return AvatarCell()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func segmentControllChanged(_ sender: Any) {
        
    }
    

}
