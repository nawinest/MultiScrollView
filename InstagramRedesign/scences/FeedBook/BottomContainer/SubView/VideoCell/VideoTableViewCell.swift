//
//  VideoTableViewCell.swift
//  InstagramRedesign
//
//  Created by Nawin Phunsawat on 12/8/2563 BE.
//  Copyright © 2563 Nawin Phunsawat. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var content: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
