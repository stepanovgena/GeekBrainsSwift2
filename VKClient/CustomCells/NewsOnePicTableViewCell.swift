//
//  NewsOnePicTableViewCell.swift
//  VKClient
//
//  Created by Gennady Stepanov on 21/01/2019.
//  Copyright © 2019 Gennady Stepanov. All rights reserved.
//

import UIKit

class NewsOnePicTableViewCell: UITableViewCell {
    
  @IBOutlet weak var newsLabel: UILabel!
  @IBOutlet weak var newsOnePicImageView: UIImageView!
  @IBOutlet weak var likes: LikeControl!
  @IBOutlet weak var comments: CommentControl!
  @IBOutlet weak var shares: ShareControl!
  @IBOutlet weak var views: ViewsControl!
  
  //MARK: Lifecycle
  override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
