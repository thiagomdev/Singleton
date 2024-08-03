//
//  LoginClientAdapterTests.swift
//  SingletonAndGlobalInstancesTests
//
//  Created by Thiago Monteiro on 02/08/24.
//

import XCTest
@testable import SingletonAndGlobalInstances

final class LoginClientAdapterTests: XCTestCase {
    func test_login() {
        let (sut, adapterSpy) = makeSut()
        let expectation = expectation(description: "Wait for a completion block!")
        var expectedDataObject: LoggedInUser?
        
        adapterSpy.urlRequest = .init(string: "https://")
        adapterSpy.expected = .init()
        
        sut.login { user in
            expectedDataObject = user
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
        
        XCTAssertTrue(adapterSpy.executeCalled)
        XCTAssertNotNil(expectedDataObject)
    }
}

final class LoginClientAdapterSpy: ApiClient {
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

extension LoginClientAdapterTests {
    private func makeSut() -> (sut: LoginClientAdapter, adapterSpy: LoginClientAdapterSpy) {
        let adapterSpy = LoginClientAdapterSpy()
        let sut = LoginClientAdapter(api: adapterSpy)
        return (sut, adapterSpy)
    }
}
