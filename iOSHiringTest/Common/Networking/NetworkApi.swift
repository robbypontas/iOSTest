//
//  NetworkApi.swift
//  iOSHiringTest
//
//  Created by Robby Pontas on 9/9/18.
//  Copyright © 2018 wonderlabs. All rights reserved.
//

import Foundation
import Moya

let networkingAPIProvider = MoyaProvider<NetworkApi>(plugins: [NetworkLoggerPlugin(verbose: true), networkActivityClosure])

public enum NetworkApi {
    case getUsers([String: String])
}

extension NetworkApi: TargetType {
    
    public var baseURL: URL { return URL(string: "http://sd2-hiring.herokuapp.com/api")! }
    
    public var path: String {
        switch self {
        case .getUsers:
            return "/users"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getUsers:
            return .get
        }
    }
    
    public var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
    public var task: Task {
        switch self {
        case .getUsers(let request):
            return urlEncodedTask(parameters: request)
        }
    }
    
    public var headers: [String : String]? {
        return [:]
    }
    
    private func jsonEncodedTask(parameters: [String: Any]) -> Task {
        return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
    }
    
    private func urlEncodedTask(parameters: [String: Any]) -> Task {
        return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
    }
    
    
}
