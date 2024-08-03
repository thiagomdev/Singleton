import Foundation

final class FeedClientAdapter {
    private let api: ApiClient
    
    init(api: ApiClient) {
        self.api = api
    }
}

extension FeedClientAdapter: FeedClientProtocol {
    func loadFeed(completion: ([FeedItem]) -> Void) {
        api.execute(request: URLRequest(url: URL(string: "https://")!)) { _ in
            completion([.init()])
        }
    }
}
