//
//  UserListPresenter.swift
//  iOSHiringTest
//
//  Created by Robby Pontas on 9/9/18.
//  Copyright © 2018 wonderlabs. All rights reserved.
//

import Foundation

class UserListPresenter: UserListPresenterProtocol {
    var userListView: UserListViewProtocols?
    
    var interactor: UserListInteractorProtocol?
    
    func viewDidLoad() {
        getUsers(isLoadmore: false, offset: 0, limit: Constants.REQUEST_LIMIT)
    }
    
    func getUsers(isLoadmore: Bool, offset: Int, limit: Int) {
        if(isLoadmore) {
            userListView?.showLoadmore()
        } else {
            userListView?.showLoading()
        }
        
        interactor?.getUsers(offset: offset, limit: limit)
    }
    
    func showUsers(response: UsersResponse) {
        userListView?.hideLoading()
        userListView?.hideLoadmore()
        userListView?.showUsers(response: response)
    }
}

extension UserListPresenter: UserListResponseProtocol {
    func onGetUsersSuccess(response: UsersResponse) {
        showUsers(response: response)
    }
    
    func onGetUsersFailed(error: String) {
        userListView?.hideLoading()
        userListView?.hideLoadmore()
        userListView?.showError(error: error)
    }
    
    
}
