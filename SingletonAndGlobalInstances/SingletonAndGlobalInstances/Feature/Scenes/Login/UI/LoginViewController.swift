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
    var adapter = LoginClientAdapter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adapter.login { user in
            // update users
        }
    }
}
