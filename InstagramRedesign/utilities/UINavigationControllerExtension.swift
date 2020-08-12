//
//  UINavigationControllerExtension.swift
//  InstagramRedesign
//
//  Created by Nawin Phunsawat on 10/8/2563 BE.
//  Copyright © 2563 Nawin Phunsawat. All rights reserved.
//

import UIKit

extension UINavigationController {
    public func clear() {
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.barTintColor = .white
        self.navigationBar.isTranslucent = false
    }
}
