//
//  UserListInteractor.swift
//  iOSHiringTest
//
//  Created by Robby Pontas on 9/9/18.
//  Copyright © 2018 wonderlabs. All rights reserved.
//

import Foundation

class UserListInteractor: UserListInteractorProtocol {
    var presenter: UserListResponseProtocol?
    
    var repository: UserListRequestProtocol?
    
    func getUsers(offset: Int, limit: Int) {
        repository?.getUserList(offset: String(offset), limit: String(limit), onSuccess: { (response) in
            if(response.status) {
                self.presenter?.onGetUsersSuccess(response: response.data)
            } else {
                self.presenter?.onGetUsersFailed(error: response.message ?? "Error")
            }
        }, onError: { (error) in
            self.presenter?.onGetUsersFailed(error: error.localizedDescription)
        })
    }
    
    
    
}
