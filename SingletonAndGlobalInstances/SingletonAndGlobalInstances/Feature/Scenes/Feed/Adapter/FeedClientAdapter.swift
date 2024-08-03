//
//  FeedClientAdapter.swift
//  SingletonAndGlobalInstances
//
//  Created by Thiago Monteiro on 02/08/24.
//

import Foundation

final class FeedClientAdapter {
    private let api = ApiClient.shared
}

extension FeedClientAdapter: FeedClientProtocol {
    func loadFeed(completion: ([FeedItem]) -> Void) {
        api.execute(request: URLRequest(url: URL(string: "https://")!)) { feedItems in
            // call the completion for example
        }
    }
}
