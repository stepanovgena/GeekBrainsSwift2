//
//  ServerEmulator.swift
//  VKClient
//
//  Created by Gennady Stepanov on 25/12/2018.
//  Copyright © 2018 Gennady Stepanov. All rights reserved.
//

import Foundation

class ServerEmulator {
  //emulating a few entries for the Server-side friends database
  static var friendEgor = Friends(name: "Егор", avatarPath: "egorAvatar.png")
  static var friendStas = Friends(name: "Стас", avatarPath: "stasAvatar.png")
  static var friendJenya = Friends(name: "Женя", avatarPath: "jenyaAvatar.png")
  static var friendKatya = Friends(name: "Катя", avatarPath: "katyaAvatar.png")
  static var friendGleb = Friends(name: "Глеб", avatarPath: "glebAvatar.png")
  
  //set 'database' as a simple dictionary
  static var friendsDataBase = ["user001": [friendEgor, friendStas, friendJenya, friendKatya, friendGleb]]
  
  static func getFriends(userId: String) -> [Friends]? {
     return friendsDataBase[userId]
  }
  
  static func updateFriends(userId: String, updatedFriendsArray: [Friends]) {
    friendsDataBase.updateValue(updatedFriendsArray, forKey: userId)
  }
  
}
