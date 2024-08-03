import UIKit

protocol FeedClientProtocol {
    func loadFeed(completion: ([FeedItem]) -> Void)
}

final class FeedViewController: UIViewController {
    var adapter = FeedClientAdapter(api: .shared)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showFeed()
    }
}

extension FeedViewController {
    private func showFeed() {
        adapter.loadFeed { feedItem in
            // final result here
        }
    }
}
