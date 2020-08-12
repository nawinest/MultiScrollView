//
//  HomeConfigurator.swift
//  InstagramRedesign
//
//  Created by Nawin Phunsawat on 10/8/2563 BE.
//  Copyright (c) 2563 Nawin Phunsawat. All rights reserved.
//

import UIKit

final class HomeConfigurator {
    
    // MARK: - Object lifecycle
    
    static let sharedInstance = HomeConfigurator()
    
    // MARK: - Configuration
    
    func configure(viewController: HomeViewController) {
        let router = HomeRouter()
        router.viewController = viewController
        
        let presenter = HomePresenter()
        presenter.viewController = viewController
        
        let interactor = HomeInteractor()
        interactor.presenter = presenter
        
        viewController.interactor = interactor
        viewController.router = router
    }
}
