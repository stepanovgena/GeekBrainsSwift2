//
//  GroupsTableViewController.swift
//  VKClient
//
//  Created by Gennady Stepanov on 26/12/2018.
//  Copyright © 2018 Gennady Stepanov. All rights reserved.
//

import UIKit

class GroupsTableViewController: UITableViewController, UISearchBarDelegate {
  
  var groupsArray: [Groups] = []
  var filteredGroupsArray: [Groups] = []
  var searchActive = false
  
  @IBOutlet var groupsTableView: UITableView!
  @IBOutlet weak var groupsSearchBar: UISearchBar!
  
  //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserGroups()
        filteredGroupsArray = groupsArray
        groupsTableView.keyboardDismissMode = .onDrag
    }
  //MARK: Setup tableView
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredGroupsArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let avatarName = filteredGroupsArray[indexPath.row].avatarPath
      let avatarImage = UIImage(named: avatarName)
      let groupsName = filteredGroupsArray[indexPath.row].name
      let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as! GroupsListCell
      cell.groupsAvatar.image = avatarImage
      cell.groupsName.text = groupsName
      return cell
    }
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
          groupsArray.remove(at: indexPath.row)
          updateUserGroupsOnServer()
          //syncronize filteredGroupsArray with the server
          updateFilteredUserGroups()
          tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
  
  //MARK: Setup searchBar
  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    searchActive = true
  }
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    hideKeyboard()
  }
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    //keep only names matching searchBar input
    filteredGroupsArray = groupsArray.filter({ (group) -> Bool in
      group.name.lowercased().contains(searchText.lowercased())
    })
    
    if (searchText.count == 0) {
      //restore initial state of data received from server
      updateFilteredUserGroups()
      searchActive = false
      hideKeyboard()
    }
    groupsTableView.reloadData()
  }
  
  @objc func hideKeyboard() {
    searchActive = false
    groupsSearchBar.endEditing(true)
  }

  
  //MARK: Prepare tableView datasource
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
  
  func updateFilteredUserGroups(){
    getUserGroups()
    filteredGroupsArray = groupsArray
  }
  
  //MARK: Navigation
  @IBAction func addGroup(segue: UIStoryboardSegue) {
    if segue.identifier == "addGroup" {
      let allGroupsTableViewController = segue.source as! AllGroupsTableViewController
      if  let groupToAddIndexPath = allGroupsTableViewController.availableGroupsTableView.indexPathForSelectedRow {
        let groupToAdd = allGroupsTableViewController.filteredAvailableGroupsArray[groupToAddIndexPath.row]
        if !groupsArray.contains(groupToAdd) {
          groupsArray.append(groupToAdd)
          updateUserGroupsOnServer()
          updateFilteredUserGroups()
          groupsTableView.reloadData()
        }
      }
    }
  }
}
