//
//  UsersResponse.swift
//  iOSHiringTest
//
//  Created by Robby Pontas on 9/9/18.
//  Copyright © 2018 wonderlabs. All rights reserved.
//

import Foundation

struct UsersResponse: Codable {
    var users: [UserModel]
    var has_more: Bool
}
