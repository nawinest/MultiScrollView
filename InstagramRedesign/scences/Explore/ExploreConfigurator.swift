//
//  ExploreConfigurator.swift
//  InstagramRedesign
//
//  Created by Nawin Phunsawat on 10/8/2563 BE.
//  Copyright (c) 2563 Nawin Phunsawat. All rights reserved.
//

import UIKit

final class ExploreConfigurator {

  // MARK: - Object lifecycle

  static let sharedInstance = ExploreConfigurator()

  // MARK: - Configuration

  func configure(viewController: ExploreViewController) {
    let router = ExploreRouter()
    router.viewController = viewController

    let presenter = ExplorePresenter()
    presenter.viewController = viewController

    let interactor = ExploreInteractor()
    interactor.presenter = presenter

    viewController.interactor = interactor
    viewController.router = router
  }
}
