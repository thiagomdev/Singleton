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
        wait(for: [expectation], timeout: 1.0)
        
        XCTAssertTrue(adapterSpy.executeCalled)
        XCTAssertNotNil(expectedDataObject)
    }
}

extension LoginClientAdapterTests {
    private func makeSut() -> (sut: LoginClientAdapter, adapterSpy: LoginClientAdapterSpy) {
        let adapterSpy = LoginClientAdapterSpy()
        let sut = LoginClientAdapter(api: adapterSpy)
        return (sut, adapterSpy)
    }
}
