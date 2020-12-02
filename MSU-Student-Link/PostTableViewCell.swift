//
//  PostTableViewCell.swift
//  MSU-Student-Link
//
//  Created by Jennifer Tran on 12/2/20.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var postContent: UILabel!
    @IBOutlet weak var commentNum: UILabel!
    @IBOutlet weak var profileView: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
