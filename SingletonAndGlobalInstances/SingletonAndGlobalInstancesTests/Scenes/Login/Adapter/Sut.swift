//
//  Sut.swift
//  SingletonAndGlobalInstances
//
//  Created by Thiago Monteiro on 03/08/24.
//

@testable import SingletonAndGlobalInstances

extension LoginClientAdapterTests {
    func makeSut() -> (sut: LoginClientAdapter, adapterSpy: LoginClientAdapterSpy) {
        let adapterSpy = LoginClientAdapterSpy()
        let sut = LoginClientAdapter(api: adapterSpy)
        return (sut, adapterSpy)
    }
}
