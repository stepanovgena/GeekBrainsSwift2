//
//  NewsTableViewController.swift
//  VKClient
//
//  Created by Gennady Stepanov on 17/01/2019.
//  Copyright © 2019 Gennady Stepanov. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
//      tableView.estimatedRowHeight = 300
//      tableView.rowHeight = UITableView.automaticDimension

    }

    // MARK: - Table view data source
//    override func numberOfSections(in tableView: UITableView) -> Int {
//    
//        return 1
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return 1
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      print("tableViewCell dequeue")
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCellReuseIdentifier", for: indexPath)

        return cell
    }
  

  
}
