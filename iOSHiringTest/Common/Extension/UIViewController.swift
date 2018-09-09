//
//  UIViewController.swift
//  iOSHiringTest
//
//  Created by Robby Pontas on 9/9/18.
//  Copyright © 2018 wonderlabs. All rights reserved.
//

import UIKit
import ALLoadingView

extension UIViewController {
    func showLoadingWithDialog() {
        if(ALLoadingView.manager.isPresented) { hideLoadingDialog() }
        ALLoadingView.manager.showLoadingView(ofType: .basic, windowMode: .windowed)
    }
    func showLoadingIndicator() {
        if(ALLoadingView.manager.isPresented) { hideLoadingDialog() }
        ALLoadingView.manager.showLoadingView(ofType: .basic)
    }
    
    func hideLoadingDialog(withDelay delay: TimeInterval? = nil, completionBlock: ALLVCompletionBlock? = nil) {
        ALLoadingView.manager.hideLoadingView(withDelay: delay, completionBlock: completionBlock)
    }
}
