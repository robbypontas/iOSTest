//
//  BaseModel.swift
//  iOSHiringTest
//
//  Created by Robby Pontas on 9/9/18.
//  Copyright © 2018 wonderlabs. All rights reserved.
//

import Foundation

struct BaseModel<T: Codable>: Codable {
    var status: Bool
    var message: String?
    var data: T
}
