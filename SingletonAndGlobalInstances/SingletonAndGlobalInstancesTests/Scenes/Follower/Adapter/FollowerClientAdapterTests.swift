//
//  FollowerClientAdapterTests.swift
//  SingletonAndGlobalInstancesTests
//
//  Created by Thiago Monteiro on 03/08/24.
//

import XCTest
@testable import SingletonAndGlobalInstances

final class FollowerClientAdapterTests: XCTestCase {
    func test_loadFeed() {
        let (sut, adapterSpy) = makeSut()
        let expectation = expectation(description: "Wait for a completion block!")
        var expectedDataObject: [Follower]?
        
        adapterSpy.urlRequest = .init(string: "https://")
        adapterSpy.expected = .init()
        
        sut.loadFollower { followers in
            expectedDataObject = followers
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
        
        XCTAssertTrue(adapterSpy.executeCalled)
        XCTAssertNotNil(expectedDataObject)
    }
}

final class FollowerClientAdapterSpy: ApiClient {
    var urlRequest: URL?
    var expected: (Data)?
    
    private(set) var executeCalled: Bool = false
    
    override func execute(request: URLRequest, completion: (Data) -> Void) {
        executeCalled = true
        urlRequest = request.url
        if let expected {
            completion(expected)
        }
    }
}

extension FollowerClientAdapterTests {
    private func makeSut() -> (sut: FollowerClientAdapter, adapterSpy: FollowerClientAdapterSpy) {
        let adapterSpy = FollowerClientAdapterSpy()
        let sut = FollowerClientAdapter(api: adapterSpy)
        return (sut, adapterSpy)
    }
}
