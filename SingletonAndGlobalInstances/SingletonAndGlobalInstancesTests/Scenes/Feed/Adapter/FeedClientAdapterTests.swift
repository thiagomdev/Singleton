import XCTest
@testable import SingletonAndGlobalInstances

final class FeedClientAdapterTests: XCTestCase {
    func test_load_feed() {
        let (sut, adapterSpy) = makeSut()
        let expectation = expectation(description: "Wait for a completion block!")
        var expectedDataObject: [FeedItem]?
        adapterSpy.expectedLoadFeed = [.init()]
        
        sut.loadFeed { feed in
            expectedDataObject = feed
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
        
        XCTAssertTrue(adapterSpy.loadFeedCalled)
        XCTAssertEqual(adapterSpy.loadFeedCount, 1)
        XCTAssertNotNil(expectedDataObject)
    }
}

extension FeedClientAdapterTests {
    private func makeSut(
        file: StaticString = #file,
        line: UInt = #line) -> (
            sut: FeedClientAdapter,
            adapterSpy: FeedClientAdapterSpy) {
                
        let adapterSpy = FeedClientAdapterSpy()
        let sut = FeedClientAdapter(api: adapterSpy)
                
        trackForMemoryLeaks(for: sut, file: file, line: line)
        trackForMemoryLeaks(for: adapterSpy, file: file, line: line)
                
        return (sut, adapterSpy)
    }
}
