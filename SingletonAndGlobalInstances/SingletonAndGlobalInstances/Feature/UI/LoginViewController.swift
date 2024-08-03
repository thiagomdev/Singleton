//
//  ViewController.swift
//  SingletonAndGlobalInstances
//
//  Created by Thiago Monteiro on 01/08/24.
//

import UIKit

class LoginViewController: UIViewController {
    var api = ApiClient.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        api.login { user in
            // show feed screen
        }
    }
}

extension ApiClient {
    func login(completion: (LoggedInUser) -> Void) {}
}

