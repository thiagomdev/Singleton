//
//  FeedViewController.swift
//  SingletonAndGlobalInstances
//
//  Created by Thiago Monteiro on 01/08/24.
//

import UIKit

class FeedViewController: UIViewController {
    var api = ApiClient.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        api.loadFeed { loadedItems in
            // update UI
        }
    }
}
