//
//  SongViewController.swift
//  InstagramRedesign
//
//  Created by Nawin Phunsawat on 12/8/2563 BE.
//  Copyright (c) 2563 Nawin Phunsawat. All rights reserved.
//

import UIKit

class SongViewController: UIViewController {
    @IBOutlet weak var mainSongTableView: UITableView!
    let dataTest: [DataTest] = [
        DataTest(title: "Omaiawa", content: "moshideru"),
        DataTest(title: "Immortal", content: "varolant"),
        DataTest(title: "Taok", content: "Taoks"),
        DataTest(title: "Long", content: "Lorem Ipsum is"),
        DataTest(title: "Omaiawa", content: "moshideru"),
        DataTest(title: "Immortal", content: "varolant"),
        DataTest(title: "Taok", content: "Taoks"),
        DataTest(title: "Long", content: "Lorem Ipsum is"),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainSongTableView.delegate = self
        self.mainSongTableView.dataSource = self
        self.mainSongTableView.register(UINib(nibName: "VideoTableViewCell", bundle: nil), forCellReuseIdentifier: "videoCell")
    }
}


extension SongViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataTest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.mainSongTableView.dequeueReusableCell(withIdentifier: "videoCell", for: indexPath) as! VideoTableViewCell
        cell.header.text = dataTest[indexPath.row].title
        cell.content.text = dataTest[indexPath.row].content
        return cell
    }
    
    
}

