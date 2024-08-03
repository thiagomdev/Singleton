import UIKit

protocol FollowerClient {
    func loadFollower(completion: ([Follower]) -> Void)
}

final class FollowerViewController: UIViewController {    
    private let followerClient: FollowerClient
    
    init(followerClient: FollowerClient) {
        self.followerClient = followerClient
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        didLoadFollowers()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FollowerViewController {
    private func didLoadFollowers() {
        followerClient.loadFollower { followers in
            // update followers
        }
    }
}
