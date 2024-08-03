import XCTest
@testable import SingletonAndGlobalInstances

final class LoginClientAdapterTests: XCTestCase {
    func test_login() {
        let (sut, adapterSpy) = makeSut()
        let exp = expectation(description: "Wait for a completion block!")
        
        var expectedDataObject: LoggedInUser?
        adapterSpy.loggedInUser = .init()
        
        sut.login { user in
            expectedDataObject = user
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 5.0)
        
        XCTAssertTrue(adapterSpy.loggedInUserCalled)
        XCTAssertEqual(adapterSpy.loggedInUserCount, 1)
        XCTAssertNotNil(expectedDataObject)
    }
}

extension LoginClientAdapterTests {
    private func makeSut(
        file: StaticString = #file,
        line: UInt = #line) -> (
            sut: LoginClientAdapter,
            adapterSpy: LoginClientAdapterSpy) {
                
        let adapterSpy = LoginClientAdapterSpy()
        let sut = LoginClientAdapter(api: adapterSpy)
                
        trackForMemoryLeaks(for: sut, file: file, line: line)
        trackForMemoryLeaks(for: adapterSpy, file: file, line: line)
                
        return (sut, adapterSpy)
    }
}
