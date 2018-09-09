//
//  UserListRepository.swift
//  iOSHiringTest
//
//  Created by Robby Pontas on 9/9/18.
//  Copyright © 2018 wonderlabs. All rights reserved.
//

import Foundation
import RxSwift

class UserListRepository: UserListRequestProtocol {
    
    private let disposeBag = DisposeBag()
    
    func getUserList(offset: String, limit: String, onSuccess: ((BaseModel<UsersResponse>) -> Void)?, onError: ((Error) -> Void)?) {
        networkingAPIProvider.rx.request(.getUsers(["offset": offset, "limit": limit]))
            .map(BaseModel<UsersResponse>.self)
            .subscribe(onSuccess: { (response) in
                onSuccess?(response)
            }) { (error) in
                onError?(error)
        }.disposed(by: disposeBag)
        
    }
    
}
