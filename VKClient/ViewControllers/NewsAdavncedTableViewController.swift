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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil),
                       forCellReuseIdentifier: newsMultiImageCellIdentifier)
    
    tableView.register(UINib(nibName: "NewsOnePicTableViewCell", bundle: nil),
                       forCellReuseIdentifier: newsSingleImageCellIdentifier)
    
    
    
    print("tableView didLoad")
    
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
    
    if let picturesCount = newsToDisplay[indexPath.row].picturesArray?.count {
    
    if (picturesCount > 6) {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: newsMultiImageCellIdentifier, for: indexPath) as! NewsTableViewCell
      cell.newsPicturesArray = newsToDisplay[indexPath.row].picturesArray ?? []
    
      resultCell = cell
    } else {
      
      let cell = tableView.dequeueReusableCell(withIdentifier: newsSingleImageCellIdentifier, for: indexPath) as! NewsOnePicTableViewCell
      cell.newsOnePicImageView.image = UIImage(named: newsToDisplay[indexPath.row].picturesArray![0])
      resultCell = cell
      }
    }
    return resultCell
  }
}
