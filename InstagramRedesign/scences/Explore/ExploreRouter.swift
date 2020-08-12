//
//  ExploreRouter.swift
//  InstagramRedesign
//
//  Created by Nawin Phunsawat on 10/8/2563 BE.
//  Copyright (c) 2563 Nawin Phunsawat. All rights reserved.
//

import UIKit

protocol ExploreRouterInterface {
  func navigateToViewController()
}

final class ExploreRouter: ExploreRouterInterface {
  weak var viewController: ExploreViewController!

  // MARK: - Navigation

    func navigateToViewController() {
        // TODO: Navigate to viewController
    }
}
