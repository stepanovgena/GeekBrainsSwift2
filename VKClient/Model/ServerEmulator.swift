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
  static var friendAlexey = Friends(name: "Алексей", avatarPath: "defaultAvatar.png")
  static var friendBoris = Friends(name: "Борис", avatarPath: "defaultAvatar.png")
  static var friendVictor = Friends(name: "Виктор", avatarPath: "defaultAvatar.png")
  static var friendDenis = Friends(name: "Денис", avatarPath: "defaultAvatar.png")
  static var friendEugeny = Friends(name: "Евгений", avatarPath: "defaultAvatar.png")
  static var friendZhora = Friends(name: "Жора", avatarPath: "defaultAvatar.png")
  static var friendZina = Friends(name: "Зина", avatarPath: "defaultAvatar.png")
  static var friendIgnat = Friends(name: "Игнат", avatarPath: "defaultAvatar.png")
  static var friendKosta = Friends(name: "Константин", avatarPath: "defaultAvatar.png")
  static var friendLena = Friends(name: "Лена", avatarPath: "defaultAvatar.png")
  static var friendMikhail = Friends(name: "Михаил", avatarPath: "defaultAvatar.png")
  static var friendNikita = Friends(name: "Никита", avatarPath: "defaultAvatar.png")
  static var friendOlga = Friends(name: "Ольга", avatarPath: "defaultAvatar.png")
  static var friendPetr = Friends(name: "Петр", avatarPath: "defaultAvatar.png")
  static var friendRoman = Friends(name: "Роман", avatarPath: "defaultAvatar.png")
  static var friendSergey = Friends(name: "Сергей", avatarPath: "defaultAvatar.png")
  static var friendTimofey = Friends(name: "Тимофей", avatarPath: "defaultAvatar.png")
  
  
  //emulating a few entries for the Server-side groups database
  static var groupsGeekBrains = Groups(name: "GeekBrains", avatarPath: "groupsGeekBrainsAvatar.png")
  static var groupsPodlodka = Groups(name: "Podlodka", avatarPath: "groupsPodlodkaAvatar.png")
  static var groupsIosDev = Groups(name: "iOS Dev", avatarPath: "groupsIosDevAvatar.png")
  static var groupsIosGoodReads = Groups(name: "iOS Good Reads", avatarPath: "groupsIosGoodReadsAvatar.png")
  static var groupsAndroidDev = Groups(name: "iOS Android Dev", avatarPath: "groupsAndroidDevAvatar.png")
  static var groupsDevLibrary = Groups(name: "Библиотека программиста", avatarPath: "groupsDevLibraryAvatar.png")
  
  //set users friends 'database' as a simple dictionary
  static var userFriendsDataBase = ["user001": [
    friendEgor,
    friendStas,
    friendJenya,
    friendKatya,
    friendGleb,
    friendAlexey,
    friendBoris,
    friendVictor,
    friendDenis,
    friendEugeny,
    friendZhora,
    friendZina,
    friendIgnat,
    friendKosta,
    friendLena,
    friendMikhail,
    friendNikita,
    friendOlga,
    friendPetr,
    friendRoman,
    friendSergey,
    friendTimofey
    ]]
  
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
