//
//  HomeInteractor.swift
//  InstagramRedesign
//
//  Created by Nawin Phunsawat on 10/8/2563 BE.
//  Copyright (c) 2563 Nawin Phunsawat. All rights reserved.
//

import UIKit

final class HomeInteractor {
    var presenter: HomePresenter!
    var model: HomeModels.Response?
    
    var worker: HomeWorker = HomeWorker(with: HomeService())
    
    // MARK: - Business logic
    
    func startDoingSomething(aRequest: HomeModels.Request) {
        worker.getSomething(aQueryString: "") { (aAny) in
            self.model = aAny as! HomeModels.Response
            
            //Convert Any object to Response Model
            self.presenter.presentSomething(aResponse: HomeModels.Response())
        }
    }
}
