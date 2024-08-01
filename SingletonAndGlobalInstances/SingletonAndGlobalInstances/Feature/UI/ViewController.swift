//
//  ViewController.swift
//  SingletonAndGlobalInstances
//
//  Created by Thiago Monteiro on 01/08/24.
//

import UIKit

class ViewController: UIViewController {
    var api = ApiClient.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        api.login() { user in
            // update UI
        }
    }
}

