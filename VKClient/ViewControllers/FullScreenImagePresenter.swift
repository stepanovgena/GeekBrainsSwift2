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
  var newCellIndexPath = IndexPath(row: 0, section: 0)
  var oldCellIndexPath = IndexPath(row: 0, section: 0)
  var scrollChangedDirection: Bool = false
  
  //MARK: Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    fullScreenCollectionView.dataSource = self
    fullScreenCollectionView.delegate = self
    
    setupCollectionViewAppearance()
    
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
    return imagesToDisplay.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let image = UIImage(named: imagesToDisplay[indexPath.row])
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FullScreenCollectionViewCell    // Configure the cell
    cell.friendsImageView.image = image
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    //update new cell index for scroll direction detection
     newCellIndexPath = indexPath
     print("from cell: \(oldCellIndexPath) to cell: \(newCellIndexPath)")
  
    //detect scroll direction by indexPath change
    var scroll = ScrollDirection.right
  
    if (newCellIndexPath.row - oldCellIndexPath.row > 0) {
      scroll = ScrollDirection.right
    } else if (newCellIndexPath.row - oldCellIndexPath.row < 0) {
       scroll = ScrollDirection.left
    }
    
      if (oldCellIndexPath.row == imagesToDisplay.count - 1) {
      scroll = ScrollDirection.left
    }
    
    //fade-in new cell
    cell.alpha = 0
    cell.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
    UIView.animate(withDuration: 1) {
      cell.alpha = 1
      cell.transform = CGAffineTransform(scaleX: 1, y: 1)
      
      //debug - cell borders ON, uncomment below
//      cell.layer.borderColor = UIColor.white.cgColor
//      cell.layer.borderWidth = 5.0
    }
    
    switch scroll {
      
    case .right:
       print("scroll right")
    //fade-out old cell
        if (indexPath.row > 0) {
        let oldIndexPath = IndexPath(row: indexPath.row - 1, section: 0)
          if let oldCell = collectionView.cellForItem(at: oldIndexPath) {
          UIView.animate(withDuration: 0.8) {
            oldCell.alpha = 0.5
            oldCell.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            }
          }
        }
        
    case .left:
       print("scroll left")
      //fade-out old cell
      if (indexPath.row < imagesToDisplay.count - 1) {
      let oldIndexPath = IndexPath(row: indexPath.row + 1, section: 0)
      if let oldCell = collectionView.cellForItem(at: oldIndexPath) {
        UIView.animate(withDuration: 0.8) {
          oldCell.alpha = 0.5
          oldCell.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }
      }
     }
    }
     oldCellIndexPath = indexPath
  }
  func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    //update old cell index for scroll direction detection
   
  }
  //leave modal onTap
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    self.dismiss(animated: true, completion: nil)
  }
  //MARK: CollectionView appearance
  private func setupCollectionViewAppearance() {
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    let flowLayout = UICollectionViewFlowLayout()
    
    flowLayout.scrollDirection = .horizontal
   
    flowLayout.minimumInteritemSpacing = 0
    flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    if (width < height) {
       flowLayout.minimumLineSpacing = 0
      flowLayout.itemSize = CGSize(width: width, height: width)
      
    } else {
       flowLayout.minimumLineSpacing = width/2
      flowLayout.itemSize = CGSize(width: height, height: height)
    }
    
    fullScreenCollectionView.collectionViewLayout = flowLayout
    fullScreenCollectionView.backgroundColor = .black
    fullScreenCollectionView.isPagingEnabled = true
  }
  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    if traitCollection.horizontalSizeClass == .compact {
      setupCollectionViewAppearance()
      print("changed to vertical")
    } else {
     setupCollectionViewAppearance()
      print("changed to horizontal")
    }
  }
  
}

//MARK: Extensions
extension FullScreenImagePresenter {
  enum ScrollDirection {
    case right
    case left
  }
}
