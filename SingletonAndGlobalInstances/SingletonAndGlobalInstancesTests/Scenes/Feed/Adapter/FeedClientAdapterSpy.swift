import XCTest
@testable import SingletonAndGlobalInstances

final class FeedClientAdapterSpy: ApiClient {
    var expectedLoadFeed: ([FeedItem])?
    
    private(set) var loadFeedCalled: Bool = false
    private(set) var loadFeedCount: Int = 0
    
    override func loadFeed(completion: ([FeedItem]) -> Void) {
        loadFeedCalled = true
        loadFeedCount += 1
        if let expectedLoadFeed {
            completion(expectedLoadFeed)
        }
    }
}
