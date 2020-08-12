//
//  HomePresenter.swift
//  InstagramRedesign
//
//  Created by Nawin Phunsawat on 10/8/2563 BE.
//  Copyright (c) 2563 Nawin Phunsawat. All rights reserved.
//
import UIKit

protocol HomePresenterInterface: NSObjectProtocol {
    func presentSomething(aDisplay: HomeModels.ViewModel.Displayed)
}

class HomePresenter {
    weak var viewController: HomePresenterInterface!
    
    func presentSomething(aResponse: HomeModels.Response) {
        //Transform Response Model to Displayed Model
        viewController.presentSomething(aDisplay: HomeModels.ViewModel.Displayed())
    }
}

