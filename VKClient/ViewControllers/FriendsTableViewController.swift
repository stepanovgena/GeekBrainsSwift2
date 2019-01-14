//
//  FriendsTableViewController.swift
//  VKClient
//
//  Created by Gennady Stepanov on 26/12/2018.
//  Copyright © 2018 Gennady Stepanov. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
  
  var friendsArray: [Friends] = []
  var friendsIndex: [Character] = []
  var friendsIndexDictionary: [Character: [Friends]] = [:]
  

    override func viewDidLoad() {
        super.viewDidLoad()
        getFriends()
        //create ordered first-letter array of friends name obtained from server
        friendsIndex = SectionIndexCreator.createOrderedIndexArray(array: friendsArray)
        //create a dictionary to map names starting from the same letter to one index
        friendsIndexDictionary = SectionIndexCreator.createFriendIndexDictionary(array: friendsArray)
    }
  //MARK: Setup tableView
    override func numberOfSections(in tableView: UITableView) -> Int {
        return friendsIndex.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      let char = friendsIndex[section]
      let rowsCount: Int  = friendsIndexDictionary[char]?.count ?? 0
      return rowsCount
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let char = friendsIndex[indexPath.section]
      let avatarName = friendsIndexDictionary[char]?[indexPath.row].avatarPath ?? "defaultAvatar.png"
      let avatarImage = UIImage(named: avatarName)
      let friendsName = friendsIndexDictionary[char]?[indexPath.row].name ?? "Ошибка получения имени"
      let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! FriendsListCell
      cell.friendsAvatar.image = avatarImage
      cell.friendsName.text = friendsName
      return cell
    }
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return String(friendsIndex[section])
  }
  
  override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
    //convert array of chars to array of strings
    let friendsIndexToStringArray = friendsIndex.map { String($0) }
    return friendsIndexToStringArray
  }
  
  //MARK: Get friends list from the server
  func getFriends() {
    if let userId = StorageEmulator.getUserId() {
      friendsArray = ServerEmulator.getFriends(userId: userId) ?? []
    }
  }
  
  // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if let destination = segue.destination as? FriendsCollectionViewController {
        if let selection = self.tableView.indexPathForSelectedRow {
          let char = friendsIndex[selection.section]
          if let selectedFriend = friendsIndexDictionary[char]?[selection.row] {
          let selectedFriendImagePath = selectedFriend.avatarPath
          destination.friendImageToDisplayPath = selectedFriendImagePath
          }
        }
      }
    }
  @IBAction func unwindToFriends(unwindSegue: UIStoryboardSegue) {
    
  }
}
