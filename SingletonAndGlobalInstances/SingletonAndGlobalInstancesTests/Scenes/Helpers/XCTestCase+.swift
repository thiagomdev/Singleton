//
//  XCTestCase+.swift
//  SingletonAndGlobalInstances
//
//  Created by Thiago Monteiro on 03/08/24.
//

import XCTest

extension XCTestCase {
    func trackForMemoryLeaks(
        for
        instance: AnyObject,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(
                instance,
                "Instance should have been deallocated. Potential memory leak."
            )
        }
    }
}
