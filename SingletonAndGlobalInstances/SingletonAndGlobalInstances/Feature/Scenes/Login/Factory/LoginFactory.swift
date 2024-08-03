import UIKit

enum LoginFactory {
    static func make() -> UIViewController {
        let client = LoginClientAdapter(api: .init())
        let viewController = LoginViewController(loginClient: client)
        return viewController
    }
}
