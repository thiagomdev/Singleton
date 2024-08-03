//
//  FeedViewController.swift
//  SingletonAndGlobalInstances
//
//  Created by Thiago Monteiro on 01/08/24.
//

import UIKit

protocol FeedClientProtocol {
    func loadFeed(completion: ([FeedItem]) -> Void)
}

final class FeedViewController: UIViewController {
    var adapter = FeedClientAdapter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adapter.loadFeed { feedItem in
            // final result here
        }
    }
}
