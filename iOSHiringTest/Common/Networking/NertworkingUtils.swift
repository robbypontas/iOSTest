//
//  NertworkingUtils.swift
//  iOSHiringTest
//
//  Created by Robby Pontas on 9/9/18.
//  Copyright © 2018 wonderlabs. All rights reserved.
//

import Moya

let networkActivityClosure = NetworkActivityPlugin { change, target  in
    if change == .began {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    } else {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}
