//
//  FeedCollectionViewCell.swift
//  InstagramRedesign
//
//  Created by Nawin Phunsawat on 10/8/2563 BE.
//  Copyright © 2563 Nawin Phunsawat. All rights reserved.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var postsImageCollectionView: UICollectionView!
    @IBOutlet weak var profileImageView: UIImageView!
    var imagesPost: [UIImage] = [UIImage(named: "img1")!, UIImage(named: "img2")!, UIImage(named: "img3")!]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.postsImageCollectionView.delegate = self
        self.postsImageCollectionView.dataSource = self
        self.postsImageCollectionView.isPagingEnabled = true
        self.pageControl.currentPageIndicatorTintColor = .darkGray
        self.pageControl.pageIndicatorTintColor = .gray
        self.pageControl.currentPage = 0
        self.profileImageView.layer.cornerRadius = 25
        self.containerView.layer.cornerRadius = 12
        self.postsImageCollectionView.register(UINib(nibName: "PostImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "imagePost")
        let postImageCollectionViewLayout = UICollectionViewFlowLayout()
        postImageCollectionViewLayout.minimumInteritemSpacing = 16
        postImageCollectionViewLayout.scrollDirection = .horizontal
        self.postsImageCollectionView.setCollectionViewLayout(postImageCollectionViewLayout, animated: true)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    func setupCell(profileImageView: UIImage? = nil,
                   name: String? = "",
                   imagesPost: [UIImage]? = []) {
        self.nameLabel.text = name
        self.profileImageView.image = profileImageView
        self.imagesPost = imagesPost!
        self.postsImageCollectionView.reloadData()
    }
    
}


extension FeedCollectionViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesPost.count
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / postsImageCollectionView.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = self.postsImageCollectionView.dequeueReusableCell(withReuseIdentifier: "imagePost", for: indexPath) as? PostImageCollectionViewCell {
            cell.setupImage(image: self.imagesPost[indexPath.row])
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.postsImageCollectionView.frame.width, height: postsImageCollectionView.frame.height)
    }
    
    
}
