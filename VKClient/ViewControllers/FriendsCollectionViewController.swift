//
//  FriendsCollectionViewController.swift
//  VKClient
//
//  Created by Gennady Stepanov on 27/12/2018.
//  Copyright © 2018 Gennady Stepanov. All rights reserved.
//

import UIKit

class FriendsCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  
  @IBOutlet var friendsImagesCollectionView: UICollectionView!
  
  private let reuseIdentifier = "friendsImageReusableCollectionCell"
  var friendToDisplay: Friends?
  var imagesToDisplay: [String] = []
  var selectedIndexPath = IndexPath(row: 0, section: 0)
  let presentTransition = CustomPresentModalAnimator()
  let dismissTransition = CustomDismissModalAnimator()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
      if let friend = friendToDisplay {
        imagesToDisplay = ServerEmulator.getUserImages(userName: friend.name)
        friendsImagesCollectionView.isUserInteractionEnabled = true
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
    print("cell selected at \(indexPath)")
    selectedIndexPath = indexPath
    let fullScreenGallery = storyboard!.instantiateViewController(withIdentifier: "FullScreenImagePresenter") as! FullScreenImagePresenter
    
    fullScreenGallery.transitioningDelegate = self
    
    fullScreenGallery.friendToDisplay = friendToDisplay
    fullScreenGallery.imagesToDisplay = imagesToDisplay
    fullScreenGallery.indexPathToScrollTo = selectedIndexPath
    
    present(fullScreenGallery, animated: true, completion: nil )
    
    
    
   //performSegue(withIdentifier: "toFullScreenGallery", sender: nil)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let destination = segue.destination as? FullScreenImagePresenter {
        destination.friendToDisplay = friendToDisplay
        destination.imagesToDisplay = imagesToDisplay
        destination.indexPathToScrollTo = selectedIndexPath
    }
  }
}

extension FriendsCollectionViewController: UIViewControllerTransitioningDelegate {
  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return presentTransition
  }
  
  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return dismissTransition
  }
}
