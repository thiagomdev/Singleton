//
//  ViewController.swift
//  SingletonAndGlobalInstances
//
//  Created by Thiago Monteiro on 01/08/24.
//

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
