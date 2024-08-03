//
//  LoginClientAdapterSpy.swift
//  SingletonAndGlobalInstances
//
//  Created by Thiago Monteiro on 03/08/24.
//
import XCTest
@testable import SingletonAndGlobalInstances

final class LoginClientAdapterSpy: ApiClient {
    var urlRequest: URL?
    var expected: (Data)?
    
    private(set) var executeCalled: Bool = false
    
    override func execute(request: URLRequest, completion: (Data) -> Void) {
        executeCalled = true
        urlRequest = request.url
        if let expected {
            completion(expected)
        }
    }
}
