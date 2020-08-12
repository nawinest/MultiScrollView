//
//  StoryCollectionViewCell.swift
//  InstagramRedesign
//
//  Created by Nawin Phunsawat on 10/8/2563 BE.
//  Copyright © 2563 Nawin Phunsawat. All rights reserved.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var storyImage: UIImageView!
    @IBOutlet weak var wrapperView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        self.wrapperView.layer.cornerRadius = 89 / 2
        self.wrapperView.backgroundColor = .clear
        self.wrapperView.layer.borderWidth = 1
        self.wrapperView.layer.borderColor = UIColor.gray.cgColor
        self.storyImage.layer.cornerRadius = 81 / 2
    }
    
    func configCell(image: String, title: String) {
        self.storyImage.image = UIImage(named: image)
        self.nameLabel.text = title
    }

}
