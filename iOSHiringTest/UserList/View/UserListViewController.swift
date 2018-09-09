//
//  UserListViewController.swift
//  iOSHiringTest
//
//  Created by Robby Pontas on 9/9/18.
//  Copyright © 2018 wonderlabs. All rights reserved.
//

import UIKit

class UserListVIewController: UIViewController {
    @IBOutlet weak var tableView: UserTableView!

    var presenter: UserListPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindModule()
        presenter?.viewDidLoad()
    }
    
    private func bindModule() {
        let generalPresenter: UserListPresenterProtocol&UserListResponseProtocol = UserListPresenter()
        presenter = generalPresenter
        
        let interactor: UserListInteractorProtocol = UserListInteractor()
        interactor.presenter = generalPresenter
        interactor.repository = UserListRepository()
        
        presenter?.interactor = interactor
        presenter?.userListView = self
        
        tableView.presenter = presenter
    }
}

extension UserListVIewController: UserListViewProtocols {
    
    func showUsers(response: UsersResponse) {
        print(response.users.count)
        tableView.showUser(response: response)
    }
    
    func showError(error: String) {
        print(error)
    }
    
    func showLoading() {
        self.showLoadingWithDialog()
    }
    
    func hideLoading() {
        self.hideLoadingDialog()
    }
    
    func showLoadmore() {
        self.tableView.setLoadmore(isLoadmore: true)
    }
    
    func hideLoadmore() {
        self.tableView.setLoadmore(isLoadmore: false)
    }
    
    
}
