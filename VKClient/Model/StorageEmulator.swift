//
//  StorageEmulator.swift
//  VKClient
//
//  Created by Gennady Stepanov on 26/12/2018.
//  Copyright © 2018 Gennady Stepanov. All rights reserved.
//

import Foundation

class StorageEmulator {
  
  static let userIdKey = "userIdKey"
  static let friendsArrayKey = "friendsArrayKey"
  
  static func setUserId(userId: String) {
    UserDefaults.standard.set(userId, forKey: userIdKey)
  }
  
  static func getUserId() -> String? {
    return UserDefaults.standard.string(forKey: userIdKey)
  }
  //TODO: fix storing [Friends] in UserdeFaults, deal with exception handling
  
//  static func setFriendsArray(friendsArray: [Friends]) {
//    UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: friendsArray, requiringSecureCoding: true), forKey: friendsArrayKey)
//  }
  
  static func getFriendsArray() -> [Friends]? {
    return UserDefaults.standard.object(forKey: friendsArrayKey) as? [Friends]
  }

  
}
