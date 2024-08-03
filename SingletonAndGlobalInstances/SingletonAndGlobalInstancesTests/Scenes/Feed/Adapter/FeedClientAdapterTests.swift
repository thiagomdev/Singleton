import XCTest
@testable import SingletonAndGlobalInstances

final class FeedClientAdapterTests: XCTestCase {
    func test_load_feed() {
        let (sut, adapterSpy) = makeSut()
        let expectation = expectation(description: "Wait for a completion block!")
        var expectedDataObject: [FeedItem]?
        
        adapterSpy.urlRequest = .init(string: "https://")
        adapterSpy.expected = .init()
        
        sut.loadFeed { feed in
            expectedDataObject = feed
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
        
        XCTAssertTrue(adapterSpy.executeCalled)
        XCTAssertNotNil(expectedDataObject)
    }
}

extension FeedClientAdapterTests {
    private func makeSut() -> (sut: FeedClientAdapter, adapterSpy: FeedClientAdapterSpy) {
        let adapterSpy = FeedClientAdapterSpy()
        let sut = FeedClientAdapter(api: adapterSpy)
        return (sut, adapterSpy)
    }
}
