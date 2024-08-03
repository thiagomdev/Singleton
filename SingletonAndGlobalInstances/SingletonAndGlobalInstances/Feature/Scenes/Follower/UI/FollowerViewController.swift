//
//  FollowerViewController.swift
//  SingletonAndGlobalInstances
//
//  Created by Thiago Monteiro on 01/08/24.
//

import UIKit

protocol FollowerClient {
    func loadFollower(completion: ([Follower]) -> Void)
}

final class FollowerViewController: UIViewController {    
    var adapter = FollowerClientAdapter(api: .shared)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adapter.loadFollower { followers in
            // update followers
        }
    }
}
