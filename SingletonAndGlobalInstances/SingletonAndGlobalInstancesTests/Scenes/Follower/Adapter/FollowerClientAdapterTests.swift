import XCTest
@testable import SingletonAndGlobalInstances

final class FollowerClientAdapterTests: XCTestCase {
    func test_load_followers() {
        let (sut, adapterSpy) = makeSut()
        let expectation = expectation(description: "Wait for a completion block!")
        var expectedDataObject: [Follower]?
        
        adapterSpy.expectedLoadFollowers = [.init()]
        
        sut.loadFollower { followers in
            expectedDataObject = followers
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
        
        XCTAssertTrue(adapterSpy.loadFollowersCalled)
        XCTAssertEqual(adapterSpy.loadFollowersCount, 1)
        XCTAssertNotNil(expectedDataObject)
    }
}

extension FollowerClientAdapterTests {
    private func makeSut(
        file: StaticString = #file,
        line: UInt = #line) -> (
            sut: FollowerClientAdapter,
            adapterSpy: FollowerClientAdapterSpy) {
                
        let adapterSpy = FollowerClientAdapterSpy()
        let sut = FollowerClientAdapter(api: adapterSpy)
                
        trackForMemoryLeaks(for: sut, file: file, line: line)
        trackForMemoryLeaks(for: adapterSpy, file: file, line: line)
                
        return (sut, adapterSpy)
    }
}
