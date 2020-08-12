//
//  ExploreWorker.swift
//  InstagramRedesign
//
//  Created by Nawin Phunsawat on 10/8/2563 BE.
//  Copyright (c) 2563 Nawin Phunsawat. All rights reserved.
//

import UIKit

protocol ExploreWorkerInterface {
  func getSomething(aQueryString: String, aCompletion: @escaping (Any) -> Void)
}

final class ExploreWorker {

    var service: ExploreService!
    
    init(with aService: ExploreService) {
        service = aService
    }

  // MARK: - Business Logic

    func getSomething(aQueryString: String, aCompletion: @escaping (Any) -> Void) {
        service.requestSomething(aSuccess: { (aAny) in
            aCompletion(aAny)
        }) { (aErrorCode) in
            if let code = aErrorCode {
                print(code)
            }
        }
    }
}
