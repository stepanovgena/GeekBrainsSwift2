//
//  News.swift
//  VKClient
//
//  Created by Gennady Stepanov on 21/01/2019.
//  Copyright © 2019 Gennady Stepanov. All rights reserved.
//

import Foundation

struct News {
  let newsId: String
  let newsText: String
  let picturesArray: [String]?
  let likesCount: Int
  let commentsCount: Int
  let sharesCount: Int
  let viewsCount: Int
  
  init (newsId: String, newsText: String, picturesArray: [String], likesCount: Int, commentsCount: Int, sharesCount: Int, viewsCount: Int) {
    self.newsId = newsId
    self.newsText = newsText
    self.picturesArray = picturesArray
    self.likesCount = likesCount
    self.commentsCount = commentsCount
    self.sharesCount = sharesCount
    self.viewsCount = viewsCount
  }
}
