//
//  UserListProtocols.swift
//  iOSHiringTest
//
//  Created by Robby Pontas on 9/9/18.
//  Copyright © 2018 wonderlabs. All rights reserved.
//

import Foundation

protocol UserListViewProtocols {
    
}

protocol UserListRequestProtocol: class {
    func getUserList(offset: String, limit: String, onSuccess: ((UsersResponse) -> Void)?, onError: ((Error) -> Void)?)
}
