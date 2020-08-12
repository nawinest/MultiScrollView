//
//  BaseTabbarControllerViewController.swift
//  InstagramRedesign
//
//  Created by Nawin Phunsawat on 10/8/2563 BE.
//  Copyright © 2563 Nawin Phunsawat. All rights reserved.
//

import UIKit

class BaseTabbarControllerViewController: UITabBarController {

    var homeViewController: UIViewController!
    var exploreViewController: UIViewController!
    var profileViewController: UIViewController!
    
    var tabItem = UITabBarItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let storyBoard: UIStoryboard = UIStoryboard(name: "HomeStoryboard", bundle: nil)
        let vc1 = storyBoard.instantiateViewController(withIdentifier: "home") as! HomeViewController
        let storyBoard2: UIStoryboard = UIStoryboard(name: "ExploreStoryboard", bundle: nil)
        let vc2 = storyBoard2.instantiateViewController(withIdentifier: "explore") as! ExploreViewController
        let storyBoard3: UIStoryboard = UIStoryboard(name: "MasterStoryboard", bundle: nil)
        let vc3 = storyBoard3.instantiateViewController(withIdentifier: "master") as! MasterViewController
        profileViewController = UINavigationController(rootViewController: vc3)
        exploreViewController = UINavigationController(rootViewController: vc2)
        homeViewController = UINavigationController(rootViewController: vc1)
        self.viewControllers = [homeViewController, exploreViewController, profileViewController]
        setUpViews()
        customTab(selectedImage: "home-selected", deselectedImage: "home", indexOfTab: 0 , tabTitle: "")
        customTab(selectedImage: "search-selected", deselectedImage: "search", indexOfTab: 1 , tabTitle: "")
        customTab(selectedImage: "user-selected", deselectedImage: "user", indexOfTab: 2 , tabTitle: "")
    }
    
    func setUpViews(){
        self.tabBar.isTranslucent = false
        self.tabBar.backgroundImage = UIImage()
        self.tabBar.barTintColor = .white
        self.tabBar.tintColor = UIColor.black
        self.tabBar.shadowImage = UIImage()
    }
    
    func customTab(selectedImage image1 : String , deselectedImage image2: String , indexOfTab index: Int , tabTitle title: String ){

        let selectedImage = UIImage(named: image1)
        let deselectedImage = UIImage(named: image2)
        
        tabItem = self.tabBar.items![index]
        tabItem.image = deselectedImage
        tabItem.selectedImage = selectedImage
        tabItem.title = .none
        tabItem.imageInsets.bottom = -16
    }
}
