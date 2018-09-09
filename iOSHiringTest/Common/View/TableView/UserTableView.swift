//
//  UserTableView.swift
//  iOSHiringTest
//
//  Created by Robby Pontas on 9/9/18.
//  Copyright © 2018 wonderlabs. All rights reserved.
//

import UIKit
import Masonry


class UserTableView: UIView {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: UserListPresenterProtocol?
    
    private var footerIndicator: UIActivityIndicatorView?
    
    private var users: [UserModel] = []
    
    private var hasLoadMore = false
    
    private var isLoadingMore = false
    
    private var offset: Int = Constants.REQUEST_LIMIT
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        let bundle = Bundle.init(for: type(of: self))
        bundle.loadNibNamed("UserTableViewAll", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        self.tableView.delegate = self
        tableView.dataSource = self
        
        configureLoadingFooter()
        
        self.footerIndicator?.startAnimating()
        
        self.tableView?.register(UINib(nibName: "UserTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "UserTableViewCell")
    }
    
    private func configureLoadingFooter() {
        let footerViewLoading = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: 40))
        self.tableView.tableFooterView = footerViewLoading
        
        footerIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        
        footerViewLoading.addSubview(footerIndicator!)
        
        footerIndicator!.mas_updateConstraints({ (make) in
            make?.centerX.mas_equalTo()(self.tableView.tableFooterView?.mas_centerX)
            make?.centerY.mas_equalTo()(self.tableView.tableFooterView?.mas_centerY)
            make?.width.mas_equalTo()(30)
            make?.height.mas_equalTo()(30)
        })
    }
    
    func setLoadmore(isLoadmore: Bool) {
        if(isLoadmore) {
            offset = offset + Constants.REQUEST_LIMIT
            footerIndicator?.startAnimating()
        } else {
            footerIndicator?.stopAnimating()
        }
        
        isLoadingMore = isLoadmore
    }
    
    func showUser(response: UsersResponse) {
        if(offset == Constants.REQUEST_LIMIT) {
            users.removeAll()
        }
        
        users.append(contentsOf: response.users)
        
        hasLoadMore = response.has_more
        
        tableView.reloadData()
    }
}

extension UserTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        cell.setData(user: users[indexPath.row])
        return cell
    }
}

extension UserTableView: UIScrollViewDelegate, UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.frame.size.height && hasLoadMore && !isLoadingMore{
            presenter?.getUsers(isLoadmore: true, offset: offset, limit: Constants.REQUEST_LIMIT)
        }
    }
}


