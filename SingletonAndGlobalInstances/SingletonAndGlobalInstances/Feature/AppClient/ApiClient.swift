//
//  AppClient.swift
//  SingletonAndGlobalInstances
//
//  Created by Thiago Monteiro on 01/08/24.
//
import Foundation

/// Singleton
///
/// The point of Singleton is,
/// you need to have just one instance to access your implementation.
/// Inside of your Singleton you can create ``static let shared: AppClient = .init()``
/// to access any implementation. Remember you must create a ``private init() {} ``
/// to guarantee just one Instance of this.
///
///
/// ```swift
///  class ApiClient {
///      static let shared: AppClient = .init()
///      private init() {}
///  }
///  ```
/// Verify that you are not using the key word final before the key word class.
/// Because the final word won't allow you inherit the Singleton to do a Unit Test for exemplo.
///
/// ```swift
/// final class ApiClient {}
/// ```

class ApiClient {
    static let shared: ApiClient = .init()    
    
    func execute(request : URLRequest, completion: (Data) -> Void) {
        // implementation
        completion(.init())
    }
}
