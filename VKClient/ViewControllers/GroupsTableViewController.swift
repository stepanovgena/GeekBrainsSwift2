//
//  GroupsTableViewController.swift
//  VKClient
//
//  Created by Gennady Stepanov on 26/12/2018.
//  Copyright © 2018 Gennady Stepanov. All rights reserved.
//

import UIKit

class GroupsTableViewController: UITableViewController {
  @IBOutlet var groupsTableView: UITableView!
  
  var groupsArray = [Groups]()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserGroups()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let avatarName = groupsArray[indexPath.row].avatarPath
      let avatarImage = UIImage(named: avatarName)
      let groupsName = groupsArray[indexPath.row].name
      let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as! GroupsListCell
      cell.groupsAvatar.image = avatarImage
      cell.groupsName.text = groupsName
      return cell
    }
  
  @IBAction func addGroup(segue: UIStoryboardSegue) {
    if segue.identifier == "addGroup" {
      let allGroupsTableViewController = segue.source as! AllGroupsTableViewController
      if  let groupToAddIndexPath = allGroupsTableViewController.availableGroupsTableView.indexPathForSelectedRow {
      let groupToAdd = ServerEmulator.availableGroupsDataBase[groupToAddIndexPath.row]
        if !groupsArray.contains(groupToAdd) {
          groupsArray.append(groupToAdd)
          updateUserGroupsOnServer()
          groupsTableView.reloadData()
      }
      }
    }
    
  }
  func getUserGroups() {
    if let userId = StorageEmulator.getUserId() {
      groupsArray = ServerEmulator.getUserGroups(userId: userId) ?? []
    }
  }
  
  func updateUserGroupsOnServer() {
     if let userId = StorageEmulator.getUserId() {
      ServerEmulator.updateUserGroups(userId: userId, updatedGroupsArray: groupsArray)
    }
  }
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
          groupsArray.remove(at: indexPath.row)
          tableView.deleteRows(at: [indexPath], with: .fade)
          updateUserGroupsOnServer()
        }
    }
}
