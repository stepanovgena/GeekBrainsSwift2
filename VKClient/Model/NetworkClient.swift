//
//  NetworkClient.swift
//  VKClient
//
//  Created by Gennady Stepanov on 25/12/2018.
//  Copyright © 2018 Gennady Stepanov. All rights reserved.
//

import Foundation

class NetworkClient {
  
  static let userId = StorageEmulator.getUserId() ?? ""
  
//  static func updateFriendsStorageFromServer() {
//    if let friendsArrayFromServer = ServerEmulator.getFriends(userId: userId) {
//    StorageEmulator.setFriendsArray(friendsArray: friendsArrayFromServer)
//    }
//  }
  
  static func updateFriendsServerfromViewController(userChangedFriendsArray: [Friends]) {
    ServerEmulator.updateUserFriends(userId: userId, updatedFriendsArray: userChangedFriendsArray)
  }
  
  static func updateGroupsStorageFromServer() {
    
  }
  
  static func updateGroupsServerfromViewController() {
    
  }
}
