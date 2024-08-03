import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return start()
    }
}

extension AppDelegate {
    private func start() -> Bool {
        window = UIWindow(frame: UIScreen.main.coordinateSpace.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = LoginFactory.make()
        return true
    }
}
