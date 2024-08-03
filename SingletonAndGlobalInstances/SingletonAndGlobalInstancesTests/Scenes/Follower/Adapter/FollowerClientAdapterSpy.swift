import XCTest
@testable import SingletonAndGlobalInstances

final class FollowerClientAdapterSpy: ApiClient {
    var expectedLoadFollowers: ([Follower])?
    private(set) var loadFollowersCalled: Bool = false
    private(set) var loadFollowersCount: Int = 0
    
    override func loadFollowers(completion: ([Follower]) -> Void) {
        loadFollowersCalled = true
        loadFollowersCount += 1
        if let expectedLoadFollowers {
            completion(expectedLoadFollowers)
        }
    }
}
