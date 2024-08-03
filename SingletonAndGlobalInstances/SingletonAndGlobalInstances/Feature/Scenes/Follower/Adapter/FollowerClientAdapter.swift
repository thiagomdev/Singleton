//
//  FollowerClientAdapter.swift
//  SingletonAndGlobalInstances
//
//  Created by Thiago Monteiro on 02/08/24.
//

import Foundation

final class FollowerClientAdapter {
    private let api: ApiClient
    
    init(api: ApiClient) {
        self.api = api
    }
}

extension FollowerClientAdapter: FollowerClient {
    func loadFollower(completion: ([Follower]) -> Void) {
        api.execute(request: URLRequest(url: URL(string: "http://")!)) { _ in
            // make the implementation here and call the completion
            completion(.init())
        }
    }
}
