//
//  MasterViewController.swift
//  InstagramRedesign
//
//  Created by Nawin Phunsawat on 12/8/2563 BE.
//  Copyright (c) 2563 Nawin Phunsawat. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {
    @IBOutlet weak var bottomContainer: UIView!
    @IBOutlet weak var overScrollView: UIScrollView!
    @IBOutlet weak var mainScollView: UIScrollView!
    var panViews: [Int: UIView] = [:]
    var currentIndex: Int = 0
    private var bottomViewController: BottomContainerViewController!
    let headerHeight: CGFloat = 150
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupMainScrollView()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? BottomContainerViewController,
                    segue.identifier == "bottomContainer" {
            self.bottomViewController = vc
            self.bottomViewController.delegate = self
        }
    }
    
    private func setupMainScrollView() {
        self.overScrollView.delegate = self
        let f = UIScreen.main.bounds
        self.mainScollView.contentSize = CGSize.init(width: f.width, height: f.height + self.headerHeight)
        self.overScrollView.contentSize = self.mainScollView.contentSize
        self.mainScollView.addGestureRecognizer(overScrollView.panGestureRecognizer)
        self.overScrollView.donotAdjustContentInset()
        self.mainScollView.donotAdjustContentInset()
        self.mainScollView.showsVerticalScrollIndicator = false
        self.overScrollView.showsVerticalScrollIndicator = false
        self.overScrollView.layer.zPosition = 300
    }
}

extension MasterViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.overScrollView {
            if scrollView.contentOffset.y <= 150 {
                self.mainScollView.contentOffset.y = scrollView.contentOffset.y
                self.panViews.forEach({ (arg0) in
                    let (_, value) = arg0
                    (value as? UIScrollView)?.contentOffset.y = 0
                })
            } else {
                self.mainScollView.contentOffset.y = 150
                if let panview = self.panViews[currentIndex] as? UIScrollView {
                    panview.contentOffset.y = scrollView.contentOffset.y - self.mainScollView.contentOffset.y
                }
            }
        }
    }
}

extension MasterViewController: BottomPagerProtocol {
    func getContentSize(for bottomView: UIView) -> CGSize{
        if let scroll = bottomView as? UIScrollView{
            let bottomHeight = max(scroll.contentSize.height, self.view.frame.height - 44)
            return CGSize.init(width: scroll.contentSize.width, height: bottomHeight + 194)
        }else{
            let bottomHeight = self.view.frame.height - 44
            return CGSize.init(width: bottomView.frame.width, height: bottomHeight + 194)
        }
        
    }
    
    
    func bottomPageViewController(_ currentViewController: UIViewController?, didSelectPageAt index: Int) {
        currentIndex = index
        if let vc = currentViewController, self.panViews[currentIndex] == nil{
            self.panViews[currentIndex] = vc.panView()
        }
        
        if let scrollView = self.panViews[currentIndex] as? UIScrollView{
            scrollView.panGestureRecognizer.require(toFail: self.overScrollView.panGestureRecognizer)
            scrollView.donotAdjustContentInset()
            scrollView.addObserver(self, forKeyPath: #keyPath(UIScrollView.contentSize), options: .new, context: nil)
            self.overScrollView.contentSize = getContentSize(for: scrollView)
        }else if let bottomView = self.panViews[currentIndex]{
            self.overScrollView.contentSize = getContentSize(for: bottomView)
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let obj = object as? UIScrollView, let scroll = self.panViews[currentIndex] as? UIScrollView {
            if obj == scroll && keyPath == #keyPath(UIScrollView.contentSize) {
                self.overScrollView.contentSize = getContentSize(for: scroll)
            }
        }
    }
}


public extension UIScrollView{
    func donotAdjustContentInset(){
        if #available(iOS 11.0, *) {
            self.contentInsetAdjustmentBehavior = .never
        }
    }
}
