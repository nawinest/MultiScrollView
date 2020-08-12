//
//  HeaderCollectionReusableView.swift
//  InstagramRedesign
//
//  Created by Nawin Phunsawat on 10/8/2563 BE.
//  Copyright © 2563 Nawin Phunsawat. All rights reserved.
//

import UIKit

struct UserStory {
    let name:String!
    let img:String!
}

class HeaderCollectionReusableView: UICollectionReusableView {
    
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    let users: [ UserStory ] = [
        UserStory(name: "Dheeraj", img: "prof-img1"),
        UserStory(name: "Sammy", img: "prof-img2"),
        UserStory(name: "Richard", img: "prof-img3"),
        UserStory(name: "Henry", img: "prof-img4"),
        UserStory(name: "Payne", img: "prof-img5"),
        UserStory(name: "Lia", img: "prof-img6")
    ]
    override func awakeFromNib() {
        super.awakeFromNib()
        setupStoryCollectionView()
    }
    
    private func setupStoryCollectionView() {
        self.mainCollectionView.delegate = self
        self.mainCollectionView.dataSource = self
        self.mainCollectionView.showsHorizontalScrollIndicator = false
        self.mainCollectionView.register(UINib(nibName: "StoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "storyCell")
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.sectionInset = .zero
        self.mainCollectionView.setCollectionViewLayout(collectionViewLayout, animated: true)
    }
    
}

extension HeaderCollectionReusableView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = self.mainCollectionView.dequeueReusableCell(withReuseIdentifier: "storyCell", for: indexPath) as? StoryCollectionViewCell {
            cell.configCell(image: users[indexPath.row].img, title: users[indexPath.row].name)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
