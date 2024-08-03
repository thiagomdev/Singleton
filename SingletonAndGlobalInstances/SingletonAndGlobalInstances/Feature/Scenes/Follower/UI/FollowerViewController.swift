import UIKit

protocol FollowerClient {
    func loadFollower(completion: ([Follower]) -> Void)
}

final class FollowerViewController: UIViewController {    
    var adapter = FollowerClientAdapter(api: .shared)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        didLoadFollowers()
    }
}

extension FollowerViewController {
    private func didLoadFollowers() {
        adapter.loadFollower { followers in
            // update followers
        }
    }
}
