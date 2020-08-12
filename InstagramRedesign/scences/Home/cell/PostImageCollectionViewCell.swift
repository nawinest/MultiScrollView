//
//  PostImageCollectionViewCell.swift
//  InstagramRedesign
//
//  Created by Nawin Phunsawat on 10/8/2563 BE.
//  Copyright © 2563 Nawin Phunsawat. All rights reserved.
//

import UIKit

class PostImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        postImageView.layer.cornerRadius = 15
        postImageView.contentMode = .scaleAspectFill
        postImageView.clipsToBounds = true
    }
    
    func setupImage(image: UIImage) {
        self.postImageView.image = image
    }

}
