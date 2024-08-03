import Foundation

/// Singleton
///
/// The point of Singleton is,
/// you need to have just one instance to access your implementation.
/// Inside of your Singleton you can create ``static let shared: AppClient = .init()``
/// to access any implementation. Remember you must create a ``private init() {} ``
/// to guarantee just one Instance of this.
///
///
/// ```swift
///  class ApiClient {
///      static let shared: AppClient = .init()
///      private init() {}
///  }
///  ```
/// Verify that you are not using the key word final before the key word class.
/// Because the final word won't allow you inherit the Singleton to do a Unit Test for exemplo.
///
/// ```swift
/// final class ApiClient {}
/// ```

class ApiClient {
    var loginAdapter: LoginClientAdapter?
    var feedAdapter: FeedClientAdapter?
    var followerAdapter: FollowerClientAdapter?

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
