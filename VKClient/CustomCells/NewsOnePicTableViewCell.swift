//
//  NewsOnePicTableViewCell.swift
//  VKClient
//
//  Created by Gennady Stepanov on 21/01/2019.
//  Copyright © 2019 Gennady Stepanov. All rights reserved.
//

import UIKit

class NewsOnePicTableViewCell: UITableViewCell {
  
  @IBOutlet weak var newsOnePicImageView: UIImageView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
