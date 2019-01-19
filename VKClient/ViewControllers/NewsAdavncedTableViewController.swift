//
//  NewsAdavncedTableViewController.swift
//  VKClient
//
//  Created by Gennady Stepanov on 19/01/2019.
//  Copyright © 2019 Gennady Stepanov. All rights reserved.
//

import Foundation
import UIKit

let simpleCellIdentifier = "newsCellReuseIdentifier"
let advancedCellIdentifier = "newsAdvancedReusableCell"

class NewsAdvancedTableViewController: UITableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //      tableView.estimatedRowHeight = 300
    //      tableView.rowHeight = UITableView.automaticDimension
    
    
    tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil),
                       forCellReuseIdentifier: advancedCellIdentifier)

    
  }
  
  // MARK: - Table view data source
  override func numberOfSections(in tableView: UITableView) -> Int {
    
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return 1
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: advancedCellIdentifier, for: indexPath)
    
    return cell
  }
  
  
  
}
