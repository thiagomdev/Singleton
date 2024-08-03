//
//  FollowerClientAdapter.swift
//  SingletonAndGlobalInstances
//
//  Created by Thiago Monteiro on 02/08/24.
//

import Foundation

final class FollowerClientAdapter {
    private let api = ApiClient.shared
}

extension FollowerClientAdapter: FollowerClient {
    func loadFollower(completion: ([Follower]) -> Void) {
        api.execute(URLRequest(url: URL(string: "http://")!)) { followers in
            // make the implementation here and call the completion
        }
    }
}
