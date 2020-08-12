//
//  BottomContainerViewController.swift
//  InstagramRedesign
//
//  Created by Nawin Phunsawat on 12/8/2563 BE.
//  Copyright (c) 2563 Nawin Phunsawat. All rights reserved.
//

import UIKit
protocol BottomPagerProtocol: NSObject {
    func bottomPageViewController(_ currentViewController: UIViewController?, didSelectPageAt index: Int)
}

class BottomContainerViewController: UIViewController {
    @IBOutlet weak var horizontalBarContraint: NSLayoutConstraint!
    private var pagerViewController: PageViewControllerViewController!
    weak var delegate: BottomPagerProtocol?
    @IBOutlet weak var swapToPage1: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pagerViewController.pagerDelegate = self
        self.delegate?.bottomPageViewController(self.pagerViewController.firstController, didSelectPageAt: 0)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PageViewControllerViewController,
                    segue.identifier == "pager" {
            self.pagerViewController = vc
        }
    }
    
    @IBAction func swappingToPage1(_ sender: Any) {
        self.pagerViewController.displayPageForIndex(index: 0)
    }
    
    @IBAction func swappingToPage2(_ sender: Any) {
        self.pagerViewController.displayPageForIndex(index: 1)
    }
    
}

extension BottomContainerViewController: PagerProtocol {
    func tp_pageViewController(_ currentViewController: UIViewController?, didSelectPageAt index: Int) {
        self.delegate?.bottomPageViewController(currentViewController, didSelectPageAt: index)
    }
    
    func currentPageWasChanged(currentIndex: Int) {
        let x = CGFloat( currentIndex ) * ( self.view.frame.width / 2 )
        self.horizontalBarContraint.constant = x
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}
 
