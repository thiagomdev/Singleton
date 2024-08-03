import UIKit

protocol LoginClientProtocol: AnyObject {
    func login(completion: (LoggedInUser) -> Void)
}

final class LoginViewController: UIViewController {
    private let loginClient: LoginClientProtocol
    
    init(loginClient: LoginClientProtocol) {
        self.loginClient = loginClient
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        showLogin()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginViewController {
    private func showLogin() {
        loginClient.login { user in
            // update user
        }
    }
}
