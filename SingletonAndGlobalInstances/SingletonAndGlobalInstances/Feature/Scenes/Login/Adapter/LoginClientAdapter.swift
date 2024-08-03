//
//  LoginClientAdapter.swift
//  SingletonAndGlobalInstances
//
//  Created by Thiago Monteiro on 02/08/24.
//

import Foundation

final class LoginClientAdapter {
    private let api: ApiClient
    
    init(api: ApiClient) {
        self.api = api
    }
}

extension LoginClientAdapter: LoginClientProtocol {
    func login(completion: (LoggedInUser) -> Void) {
        api.execute(request: URLRequest(url: URL(string: "https://")!)) { _ in
            // call the completion
            completion(.init())
        }
    }
}
