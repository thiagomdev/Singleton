//
//  FeedClientAdapterTests.swift
//  SingletonAndGlobalInstancesTests
//
//  Created by Thiago Monteiro on 03/08/24.
//

import XCTest
@testable import SingletonAndGlobalInstances

final class FeedClientAdapterTests: XCTestCase {
    func test_loadFeed() {
        let (sut, adapterSpy) = makeSut()
        let expectation = expectation(description: "Wait for a completion block!")
        var expectedDataObject: [FeedItem]?
        
        adapterSpy.urlRequest = .init(string: "https://")
        adapterSpy.expected = .init()
        
        sut.loadFeed { feed in
            expectedDataObject = feed
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
        
        XCTAssertTrue(adapterSpy.executeCalled)
        XCTAssertNotNil(expectedDataObject)
    }
}

final class FeedClientAdapterSpy: ApiClient {
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

extension FeedClientAdapterTests {
    private func makeSut() -> (sut: FeedClientAdapter, adapterSpy: FeedClientAdapterSpy) {
        let adapterSpy = FeedClientAdapterSpy()
        let sut = FeedClientAdapter(api: adapterSpy)
        return (sut, adapterSpy)
    }
}
