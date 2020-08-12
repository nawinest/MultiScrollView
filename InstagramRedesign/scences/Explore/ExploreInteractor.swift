//
//  ExploreInteractor.swift
//  InstagramRedesign
//
//  Created by Nawin Phunsawat on 10/8/2563 BE.
//  Copyright (c) 2563 Nawin Phunsawat. All rights reserved.
//

import UIKit

protocol ExploreInteractorInterface {
    func startDoingSomething(aRequest: ExploreModels.Request)
    var model: Any? { get }
}

final class ExploreInteractor: ExploreInteractorInterface {
    var presenter: ExplorePresenterInterface!
    var model: Any?
    
    var worker: ExploreWorker = ExploreWorker(with: ExploreService())
    
    // MARK: - Business logic
    
    func startDoingSomething(aRequest: ExploreModels.Request) {
        worker.getSomething(aQueryString: "") { (aAny) in
            self.model = aAny
            
            //Convert Any object to Response Model
            self.presenter.presentSomething(aResponse: ExploreModels.Respoonse())
        }
    }
}

