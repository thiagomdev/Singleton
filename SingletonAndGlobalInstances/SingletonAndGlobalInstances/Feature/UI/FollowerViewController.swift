//
//  FollowerViewController.swift
//  SingletonAndGlobalInstances
//
//  Created by Thiago Monteiro on 01/08/24.
//

import UIKit

class FollowerViewController: UIViewController {
    var api = ApiClient.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        api.loadFollower { followers in
            // update followers
        }
    }
}

extension ApiClient {
    func loadFollower(completion: ([Follower]) -> Void) {
        
    }
}
