//
//  FriendsTableViewController.swift
//  VKClient
//
//  Created by Gennady Stepanov on 26/12/2018.
//  Copyright © 2018 Gennady Stepanov. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
  
   var friendsArray = [Friends]()

    override func viewDidLoad() {
        super.viewDidLoad()
        getFriends()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let avatarName = friendsArray[indexPath.row].avatarPath
      let avatarImage = UIImage(named: avatarName)
      let friendsName = friendsArray[indexPath.row].name
      let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! FriendsListCell
      cell.friendsAvatar.image = avatarImage
      cell.friendsName.text = friendsName
      return cell
    }
  
  func getFriends() {
    if let userId = StorageEmulator.getUserId() {
      friendsArray = ServerEmulator.getFriends(userId: userId) ?? []
    }
  }
  
  // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if let destination = segue.destination as? FriendsCollectionViewController {
        if let selectedRow = self.tableView.indexPathForSelectedRow?.row {
          let selectedFriend = friendsArray[selectedRow]
          let selectedFriendImagePath = selectedFriend.avatarPath
          destination.friendImageToDisplayPath = selectedFriendImagePath
        }
      }
    }
  @IBAction func unwindToFriends(unwindSegue: UIStoryboardSegue) {
    
  }
}
