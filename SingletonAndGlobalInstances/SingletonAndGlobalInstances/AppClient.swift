//
//  AppClient.swift
//  SingletonAndGlobalInstances
//
//  Created by Thiago Monteiro on 01/08/24.
//

/// Singleton
///
/// The point of Singleton is, you need to have just one instance to access your implementation. Inside of your Singleton you can create ``static let shared: AppClient = .init()`` to access any implementation. Remember you must create a ``private init() {} `` to guarantee just one Instance of this.
///
///
/// ```swift
///  class AppClient {
///      static let shared: AppClient = .init()
///      private init() {}
///  }
///  ```
class AppClient {
    static let shared: AppClient = .init()
    
    private init() {}
}
