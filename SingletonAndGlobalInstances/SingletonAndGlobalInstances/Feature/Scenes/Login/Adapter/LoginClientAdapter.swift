//
//  LoginClientAdapter.swift
//  SingletonAndGlobalInstances
//
//  Created by Thiago Monteiro on 02/08/24.
//

import Foundation

final class LoginClientAdapter {
    private let api: ApiClient = .shared
}

extension LoginClientAdapter: LoginClientProtocol {
    func login(completion: (LoggedInUser) -> Void) {
        api.execute(URLRequest(url: URL(string: "https://")!)) { loggedInUser in
            // call the completion
        }
    }
}
