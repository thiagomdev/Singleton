import Foundation

class ApiClient {
    private var loginAdapter: LoginClientAdapter?
    private var feedAdapter: FeedClientAdapter?
    private var followerAdapter: FollowerClientAdapter?

    init() { }
    
    func login(completion: (LoggedInUser) -> Void) {
        loginAdapter?.login { user in
            completion(user)
        }
    }
    
    func loadFeed(completion: ([FeedItem]) -> Void) {
        feedAdapter?.loadFeed { feed in
            completion(feed)
        }
    }
    
    func loadFollowers(completion: ([Follower]) -> Void) {
        followerAdapter?.loadFollower { followers in
            completion(followers)
        }
    }
}
