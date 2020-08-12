//
//  HomeRouter.swift
//  InstagramRedesign
//
//  Created by Nawin Phunsawat on 10/8/2563 BE.
//  Copyright (c) 2563 Nawin Phunsawat. All rights reserved.
//

import UIKit

protocol HomeRouterInterface {
    func navigateToViewController()
}

final class HomeRouter: HomeRouterInterface {
    weak var viewController: HomeViewController!
    
    // MARK: - Navigation
    
    func navigateToViewController() {
        // TODO: Navigate to viewController
    }
}

