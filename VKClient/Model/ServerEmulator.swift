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
  
  //emulating a few entries for the Server-side groups database
  static var groupsGeekBrains = Groups(name: "GeekBrains", avatarPath: "groupsGeekBrainsAvatar.png")
  static var groupsPodlodka = Groups(name: "Podlodka", avatarPath: "groupsPodlodkaAvatar.png")
  static var groupsIosDev = Groups(name: "iOS Dev", avatarPath: "groupsIosDevAvatar.png")
  static var groupsIosGoodReads = Groups(name: "iOS Good Reads", avatarPath: "groupsIosGoodReadsAvatar.png")
  static var groupsAndroidDev = Groups(name: "iOS Android Dev", avatarPath: "groupsAndroidDevAvatar.png")
  static var groupsDevLibrary = Groups(name: "Библиотека программиста", avatarPath: "groupsDevLibraryAvatar.png")
  
  //set users friends 'database' as a simple dictionary
  static var userFriendsDataBase = ["user001": [friendEgor, friendStas, friendJenya, friendKatya, friendGleb]]
  
  //set users groups 'database' as a simple dictionary
  static var userGroupsDataBase = ["user001": [groupsGeekBrains, groupsPodlodka, groupsIosDev, groupsIosGoodReads]]

  //set users groups 'database' as a simple dictionary
  static var availableGroupsDataBase = [groupsGeekBrains, groupsPodlodka, groupsIosDev, groupsIosGoodReads, groupsAndroidDev, groupsDevLibrary]
  
  
  static func getFriends(userId: String) -> [Friends]? {
     return userFriendsDataBase[userId]
  }
  
  static func updateUserFriends(userId: String, updatedFriendsArray: [Friends]) {
    userFriendsDataBase.updateValue(updatedFriendsArray, forKey: userId)
  }
  
  static func getUserGroups(userId: String) -> [Groups]? {
    return userGroupsDataBase[userId]
  }
  
  static func getAvailableGroups() -> [Groups]? {
    return availableGroupsDataBase
  }
  
  static func updateUserGroups(userId: String, updatedGroupsArray: [Groups]) {
    userGroupsDataBase.updateValue(updatedGroupsArray, forKey: userId)
  }
}
