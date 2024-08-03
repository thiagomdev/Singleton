import XCTest
@testable import SingletonAndGlobalInstances

final class LoginClientAdapterSpy: ApiClient {
    var loggedInUser: (LoggedInUser)?
    
    private(set) var loggedInUserCalled: Bool = false
    private(set) var loggedInUserCount: Int = 0
    
    override func login(completion: (LoggedInUser) -> Void) {
        loggedInUserCalled = true
        loggedInUserCount += 1
        if let loggedInUser {
            completion(loggedInUser)
        }
    }
}
