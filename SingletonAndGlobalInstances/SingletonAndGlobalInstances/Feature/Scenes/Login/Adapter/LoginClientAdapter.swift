import Foundation

final class LoginClientAdapter {
    private let api: ApiClient
    
    init(api: ApiClient) {
        self.api = api
    }
}

extension LoginClientAdapter: LoginClientProtocol {
    func login(completion: (LoggedInUser) -> Void) {
        api.login { user in
            completion(user)
        }
    }
}
