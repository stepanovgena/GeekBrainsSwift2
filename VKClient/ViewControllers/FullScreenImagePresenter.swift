//
//  FullScreenImagePresenter.swift
//  VKClient
//
//  Created by Gennady Stepanov on 27/01/2019.
//  Copyright © 2019 Gennady Stepanov. All rights reserved.
//

import UIKit

class FullScreenImagePresenter: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  
  @IBOutlet weak var fullScreenCollectionView: UICollectionView!
  private let reuseIdentifier = "fullScreenCollectionViewCellIdentifier"
  var friendToDisplay: Friends?
  var imagesToDisplay: [String] = []
  var indexPathToScrollTo = IndexPath(row:0, section:0)
  //var friendImageToDisplayPath = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    fullScreenCollectionView.dataSource = self
    fullScreenCollectionView.delegate = self
    fullScreenCollectionView.backgroundColor = .black
    print("fullscreencolelctionview did load")
    if let friend = friendToDisplay {
      imagesToDisplay = ServerEmulator.getUserImages(userName: friend.name)
      fullScreenCollectionView.scrollToItem(at: indexPathToScrollTo, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
    }
  }
  
  // MARK: UICollectionViewDataSource
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    print("images to display \(imagesToDisplay) total items: \(imagesToDisplay.count)")
    return imagesToDisplay.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    print("fullscreencell set up")
    let image = UIImage(named: imagesToDisplay[indexPath.row])
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FullScreenCollectionViewCell    // Configure the cell
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
    
        if (indexPath.row > 0) {
        let oldIndexPath = IndexPath(row: indexPath.row - 1, section: 0)
          if let oldCell = collectionView.cellForItem(at: oldIndexPath) {
          UIView.animate(withDuration: 0.8) {
           // let tranlsationX = self.view.bounds.width
            oldCell.alpha = 0.5
            oldCell.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
//            //oldCell.transform = CGAffineTransform(translationX: -tranlsationX, y: 0)
//            self.fullScreenCollectionView.scrollToItem(at: indexPath, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
//            cell.transform = CGAffineTransform(translationX: -tranlsationX/2, y: 0)
//              self.fullScreenCollectionView.scrollToItem(at: indexPath, at: UICollectionView.ScrollPosition.right, animated: true)
            }
          }
        }
  }
  func collectionView(_ collectionView: UICollectionView,
                      didEndDisplaying cell: UICollectionViewCell,
                      forItemAt indexPath: IndexPath) {
    UIView.animate(withDuration: 0.8) {
      cell.alpha = 0
      cell.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    self.dismiss(animated: true, completion: nil)
  }
}
