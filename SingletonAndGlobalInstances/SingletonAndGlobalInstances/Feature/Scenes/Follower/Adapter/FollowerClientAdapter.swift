import Foundation

final class FollowerClientAdapter {
    private let api: ApiClient
    
    init(api: ApiClient) {
        self.api = api
    }
}

extension FollowerClientAdapter: FollowerClient {
    func loadFollower(completion: ([Follower]) -> Void) {
        api.loadFollowers { followers in
            completion(followers)
        }
    }
}
