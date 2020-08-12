//
//  PageViewControllerViewController.swift
//  InstagramRedesign
//
//  Created by Nawin Phunsawat on 12/8/2563 BE.
//  Copyright (c) 2563 Nawin Phunsawat. All rights reserved.
//

import UIKit

protocol PagerProtocol: NSObject {
    func tp_pageViewController(_ currentViewController: UIViewController?, didSelectPageAt index: Int)
    func currentPageWasChanged(currentIndex: Int)
}

class PageViewControllerViewController: UIPageViewController {
    weak var pagerDelegate: PagerProtocol?
    private var currentPageIndex: Int = 0
    let controllers = [
           UIStoryboard(name: "VideoStoryboard",
                        bundle: nil).instantiateViewController(withIdentifier: "video") as! VideoViewController,
           UIStoryboard(name: "SongStoryboard",
                        bundle: nil).instantiateViewController(withIdentifier: "song") as! SongViewController
    ]
    
    var firstController: UIViewController{
        get {
            self.controllers.first!
        }
    }
    
    func displayPageForIndex(index: Int, animated: Bool = true) {
        if self.currentPageIndex == index { return }

        if index < self.currentPageIndex {
            self.setViewControllers([self.controllers[index]], direction: .reverse, animated: true, completion: nil)
        } else if index > self.currentPageIndex {
            self.setViewControllers([self.controllers[index]], direction: .forward, animated: true, completion: nil)
        }
        self.currentPageIndex = index
        self.pagerDelegate?.currentPageWasChanged(currentIndex: self.currentPageIndex)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        view.backgroundColor = .white
           
        guard  let controllersFirst = controllers.first else { return }
        self.setViewControllers([controllersFirst], direction: .forward, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension PageViewControllerViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = self.controllers.firstIndex(where: {$0 == viewController}) ?? 0
        self.currentPageIndex = index
        self.pagerDelegate?.currentPageWasChanged(currentIndex: self.currentPageIndex)
        if index == 0 { return nil }
        return controllers[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = self.controllers.firstIndex(where: {$0 == viewController}) ?? 0
        self.currentPageIndex = index
        self.pagerDelegate?.currentPageWasChanged(currentIndex: self.currentPageIndex)
        if index == controllers.count - 1 { return nil }
        return controllers[index + 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if !completed { return }
        
        guard let viewController = pageViewController.viewControllers?.first,
            let index = controllers.firstIndex(of: viewController) else {
            return
        }
        self.currentPageIndex = index
        self.pagerDelegate?.currentPageWasChanged(currentIndex: self.currentPageIndex)
        pagerDelegate?.tp_pageViewController(pageViewController.viewControllers?.first, didSelectPageAt: index)
    }

}


protocol PannableViewsProtocol {
    func panView() -> UIView
}

extension PannableViewsProtocol where Self: UIViewController{
    func panView() -> UIView{
        if let scroll = self.view.subviews.first(where: {$0 is UIScrollView}){
            return scroll
        }else{
            return self.view
        }
    }
}

extension UIViewController: PannableViewsProtocol{}
