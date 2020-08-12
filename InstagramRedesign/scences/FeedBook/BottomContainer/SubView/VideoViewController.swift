//
//  VideoViewController.swift
//  InstagramRedesign
//
//  Created by Nawin Phunsawat on 12/8/2563 BE.
//  Copyright (c) 2563 Nawin Phunsawat. All rights reserved.
//

import UIKit

struct DataTest {
    var title: String
    var content: String
}
class VideoViewController: UIViewController {
    @IBOutlet weak var mainVideoTableView: UITableView!
    let dataTest: [DataTest] = [
        DataTest(title: "เมาคลี", content: "Moakri Lasus"),
        DataTest(title: "Dominent", content: "Toret"),
        DataTest(title: "Cloam", content: "Dome"),
        DataTest(title: "Rim", content: "Stone"),
        DataTest(title: "Omaiawa", content: "moshideru"),
        DataTest(title: "Immortal", content: "varolant"),
        DataTest(title: "Taok", content: "Taoks"),
        DataTest(title: "Long", content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainVideoTableView.delegate = self
        self.mainVideoTableView.dataSource = self
        self.mainVideoTableView.register(UINib(nibName: "VideoTableViewCell", bundle: nil), forCellReuseIdentifier: "videoCell")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension VideoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataTest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.mainVideoTableView.dequeueReusableCell(withIdentifier: "videoCell", for: indexPath) as! VideoTableViewCell
        cell.header.text = dataTest[indexPath.row].title
        cell.content.text = dataTest[indexPath.row].content
        return cell
    }
    
    
}

