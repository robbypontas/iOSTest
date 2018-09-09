//
//  UserListProtocols.swift
//  iOSHiringTest
//
//  Created by Robby Pontas on 9/9/18.
//  Copyright © 2018 wonderlabs. All rights reserved.
//

import Foundation

protocol UserListViewProtocols {
    var presenter: UserListPresenterProtocol? { get set }
    
    func showUsers(response: UsersResponse)
    func showError(error: String)
    
    func showLoading()
    func hideLoading()
    func showLoadmore()
    func hideLoadmore()
}

protocol UserListRequestProtocol: class {
    func getUserList(offset: String, limit: String, onSuccess: ((BaseModel<UsersResponse>) -> Void)?, onError: ((Error) -> Void)?)
}

protocol UserListResponseProtocol: class {
    func onGetUsersSuccess(response: UsersResponse)
    func onGetUsersFailed(error: String)
}

protocol UserListInteractorProtocol: class {
    var presenter: UserListResponseProtocol? { get set }
    var repository: UserListRequestProtocol? { get set }
    
    func getUsers(offset: Int, limit: Int)
}

protocol UserListPresenterProtocol: class {
    var userListView: UserListViewProtocols? { get set }
    var interactor: UserListInteractorProtocol? { get set }
    
    func viewDidLoad()
    func getUsers(isLoadmore: Bool, offset: Int, limit: Int)
    func showUsers(response: UsersResponse)
}
