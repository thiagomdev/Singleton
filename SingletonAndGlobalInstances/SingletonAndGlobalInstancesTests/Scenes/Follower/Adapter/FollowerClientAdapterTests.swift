import XCTest
@testable import SingletonAndGlobalInstances

final class FollowerClientAdapterTests: XCTestCase {
    func test_load_followers() {
        let (sut, adapterSpy) = makeSut()
        let expectation = expectation(description: "Wait for a completion block!")
        var expectedDataObject: [Follower]?
        
        adapterSpy.urlRequest = .init(string: "https://")
        adapterSpy.expected = .init()
        
        sut.loadFollower { followers in
            expectedDataObject = followers
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
        
        XCTAssertTrue(adapterSpy.executeCalled)
        XCTAssertNotNil(expectedDataObject)
    }
}

extension FollowerClientAdapterTests {
    private func makeSut() -> (sut: FollowerClientAdapter, adapterSpy: FollowerClientAdapterSpy) {
        let adapterSpy = FollowerClientAdapterSpy()
        let sut = FollowerClientAdapter(api: adapterSpy)
        return (sut, adapterSpy)
    }
}
