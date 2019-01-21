//
//  NewsAdavncedTableViewController.swift
//  VKClient
//
//  Created by Gennady Stepanov on 19/01/2019.
//  Copyright © 2019 Gennady Stepanov. All rights reserved.
//

import Foundation
import UIKit

class NewsAdvancedTableViewController: UITableViewController {
  
  let newsMultiImageCellIdentifier = "newsAdvancedReusableCell"
  let newsSingleImageCellIdentifier = "newsOnePicTableViewCellReuseIdentifier"
  var newsToDisplay: [News] = []
  
  //MARK: Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil),
                       forCellReuseIdentifier: newsMultiImageCellIdentifier)
    
    tableView.register(UINib(nibName: "NewsOnePicTableViewCell", bundle: nil),
                       forCellReuseIdentifier: newsSingleImageCellIdentifier)
    if let news = ServerEmulator.getNews() {
      newsToDisplay = news
    }
  }
  
  // MARK: - Table view data source
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return newsToDisplay.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var resultCell = UITableViewCell()
    let news = newsToDisplay[indexPath.row]
    if let picturesCount = newsToDisplay[indexPath.row].picturesArray?.count {
      
      if (picturesCount > 6) {
        //enough pictures for 7-image mockup
        let cell = tableView.dequeueReusableCell(withIdentifier: newsMultiImageCellIdentifier, for: indexPath) as! NewsTableViewCell
        setNewsAttributesToDisplayFull(news: news, cellToDisplay: cell, indexPath: indexPath)
        resultCell = cell
        } else {
          //images less than 7 -> dislay only the first one
          let cell = tableView.dequeueReusableCell(withIdentifier: newsSingleImageCellIdentifier, for: indexPath) as! NewsOnePicTableViewCell
          setNewsAttributesToDisplaySingleImage(news: news, cellToDisplay: cell, indexPath: indexPath)
          resultCell = cell
        }
      }
    return resultCell
  }
  //TODO: consider protocol for cells that dislay news to avoid code repetition
  func setNewsAttributesToDisplayFull(news: News, cellToDisplay: NewsTableViewCell, indexPath: IndexPath) {
    cellToDisplay.newsLabel.text = newsToDisplay[indexPath.row].newsText
    cellToDisplay.newsPicturesArray = newsToDisplay[indexPath.row].picturesArray ?? []
    cellToDisplay.likes.updateLikesCount(likes: newsToDisplay[indexPath.row].likesCount)
    cellToDisplay.comments.updateCommentsCount(comments: newsToDisplay[indexPath.row].commentsCount)
    cellToDisplay.shares.updateSharesCount(comments: newsToDisplay[indexPath.row].sharesCount)
    cellToDisplay.views.updateViewsCount(comments: newsToDisplay[indexPath.row].viewsCount)
  }
  
  func setNewsAttributesToDisplaySingleImage(news: News, cellToDisplay: NewsOnePicTableViewCell, indexPath: IndexPath) {
    cellToDisplay.newsLabel.text = newsToDisplay[indexPath.row].newsText
    cellToDisplay.newsOnePicImageView.image = UIImage(named: newsToDisplay[indexPath.row].picturesArray![0])
    cellToDisplay.likes.updateLikesCount(likes: newsToDisplay[indexPath.row].likesCount)
    cellToDisplay.comments.updateCommentsCount(comments: newsToDisplay[indexPath.row].commentsCount)
    cellToDisplay.shares.updateSharesCount(comments: newsToDisplay[indexPath.row].sharesCount)
    cellToDisplay.views.updateViewsCount(comments: newsToDisplay[indexPath.row].viewsCount)
  }
}
