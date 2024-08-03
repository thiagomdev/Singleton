import Foundation

final class LoginClientAdapter {
    private let api: ApiClient
    
    init(api: ApiClient) {
        self.api = api
    }
}

extension LoginClientAdapter: LoginClientProtocol {
    func login(completion: (LoggedInUser) -> Void) {
        api.execute(request: URLRequest(url: URL(string: "https://")!)) { _ in
            completion(.init())
        }
    }
}
