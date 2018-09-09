//
//  UserModel.swift
//  iOSHiringTest
//
//  Created by Robby Pontas on 9/9/18.
//  Copyright © 2018 wonderlabs. All rights reserved.
//

import Foundation

struct UserModel: Codable {
    var name: String
    var image: String
    var items: [String]
}
