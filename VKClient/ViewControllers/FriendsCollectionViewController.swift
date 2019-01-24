//
//  FriendsCollectionViewController.swift
//  VKClient
//
//  Created by Gennady Stepanov on 27/12/2018.
//  Copyright © 2018 Gennady Stepanov. All rights reserved.
//

import UIKit

class FriendsCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
 
  private let reuseIdentifier = "friendsImageReusableCollectionCell"
  var friendToDisplay: Friends?
  var imagesToDisplay: [String] = []
  //var friendImageToDisplayPath = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
      if let friend = friendToDisplay {
        imagesToDisplay = ServerEmulator.getUserImages(userName: friend.name)
      }
    }

    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesToDisplay.count
    }

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let image = UIImage(named: imagesToDisplay[indexPath.row])
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FriendsCollectionViewCell
        // Configure the cell
        cell.friendsImageView.image = image
        return cell
    }
  
  func collectionView(_ collectionView: UICollectionView,
                               willDisplay cell: UICollectionViewCell,
                               forItemAt indexPath: IndexPath) {
    
    cell.alpha = 0
    cell.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
    UIView.animate(withDuration: 0.8) {
      cell.alpha = 1
      cell.transform = CGAffineTransform(scaleX: 1, y: 1)
      
    }
    
//    if (indexPath.row > 1) {
//    let oldIndexPath = IndexPath(row: indexPath.row - 2, section: 0)
//      if let oldCell = collectionView.cellForItem(at: oldIndexPath) {
//      UIView.animate(withDuration: 0.8) {
//        oldCell.alpha = 0.5
//        oldCell.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
//        }
//      }
//    }
  }
  func collectionView(_ collectionView: UICollectionView,
                      didEndDisplaying cell: UICollectionViewCell,
                      forItemAt indexPath: IndexPath) {
    UIView.animate(withDuration: 0.8) {
      cell.alpha = 0
      cell.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
    }
  }
}
