import UIKit

protocol FeedClientProtocol {
    func loadFeed(completion: ([FeedItem]) -> Void)
}

final class FeedViewController: UIViewController {
    private let feedClient: FeedClientProtocol
    
    init(feedClient: FeedClientProtocol) {
        self.feedClient = feedClient
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        showFeed()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FeedViewController {
    private func showFeed() {
        feedClient.loadFeed { feed in
            // update feed
        }
    }
}
