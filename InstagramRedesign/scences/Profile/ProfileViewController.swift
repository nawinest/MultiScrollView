//
//  ProfileViewController.swift
//  InstagramRedesign
//
//  Created by Nawin Phunsawat on 10/8/2563 BE.
//  Copyright (c) 2563 Nawin Phunsawat. All rights reserved.
//

import UIKit
class ProfileViewController: UIViewController {

    @IBOutlet weak var overlayScrollView: UIScrollView!
    @IBOutlet weak var backgroudScrollView: UIScrollView!
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
//        self.mainTableView.isScrollEnabled = false
        self.backgroudScrollView.delegate = self
        self.overlayScrollView.delegate = self
        let f = UIScreen.main.bounds
        self.backgroudScrollView.contentSize = CGSize.init(width: f.width, height: f.height + 200)
        self.overlayScrollView.contentSize = self.backgroudScrollView.contentSize
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.mainTableView.dequeueReusableCell(withIdentifier: "recell") as! MainTableViewCell
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.overlayScrollView {
            if scrollView.contentOffset.y <= 200 {
                self.backgroudScrollView.contentOffset.y = scrollView.contentOffset.y
            } else {
                self.backgroudScrollView.contentOffset.y = 200
                self.mainTableView.contentOffset.y = scrollView.contentOffset.y - self.backgroudScrollView.contentOffset.y
            }
        }
    }
}

