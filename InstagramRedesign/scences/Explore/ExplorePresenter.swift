//
//  ExplorePresenter.swift
//  InstagramRedesign
//
//  Created by Nawin Phunsawat on 10/8/2563 BE.
//  Copyright (c) 2563 Nawin Phunsawat. All rights reserved.
//

import UIKit

protocol ExplorePresenterInterface {
    func presentSomething(aResponse: ExploreModels.Respoonse)
}

class ExplorePresenter: ExplorePresenterInterface {
    weak var viewController: ExploreView!
    
    func presentSomething(aResponse: ExploreModels.Respoonse) {
        //Transform Response Model to Displayed Model
        viewController.displaySomething(aDisplay: ExploreModels.ViewModel.Displayed())
    }
}

