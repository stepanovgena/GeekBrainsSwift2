//
//  AllGroupsTableViewController.swift
//  VKClient
//
//  Created by Gennady Stepanov on 26/12/2018.
//  Copyright © 2018 Gennady Stepanov. All rights reserved.
//

import UIKit

class AllGroupsTableViewController: UITableViewController {
  @IBOutlet var availableGroupsTableView: UITableView!
  
  var availableGroupsArray = [Groups]()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        getAvailableGroups()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
      return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return availableGroupsArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

      let avatarName = availableGroupsArray[indexPath.row].avatarPath
      let avatarImage = UIImage(named: avatarName)
      let groupsName = availableGroupsArray[indexPath.row].name
      let cell = tableView.dequeueReusableCell(withIdentifier: "availableGroupsCell", for: indexPath) as! GroupsListCell
      cell.groupsAvatar.image = avatarImage
      cell.groupsName.text = groupsName
      return cell
    }
  
  func getAvailableGroups() {
    availableGroupsArray = ServerEmulator.getAvailableGroups() ?? []
  }
}
