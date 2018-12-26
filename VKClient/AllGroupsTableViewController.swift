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
      
      
        availableGroupsArray = ServerEmulator.getAvailableGroups() ?? []


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

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
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

  }
  
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

  }

  

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
