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
            completion(.init())
        }
    }
}
