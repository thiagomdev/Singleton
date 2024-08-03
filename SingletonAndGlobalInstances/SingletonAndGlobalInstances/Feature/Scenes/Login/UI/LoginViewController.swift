import UIKit

protocol LoginClientProtocol: AnyObject {
    func login(completion: (LoggedInUser) -> Void)
}

final class LoginViewController: UIViewController {
    var adapter = LoginClientAdapter(api: .shared)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showLogin()
    }
}

extension LoginViewController {
    private func showLogin() {
        adapter.login { user in
            // update users
        }
    }
}
