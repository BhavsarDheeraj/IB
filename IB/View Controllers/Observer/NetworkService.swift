//
//  NetworkService.swift
//  IB
//
//  Created by Dheeraj Bhavsar on 30/12/24.
//

import Foundation

final class NetworkService {
    
    static let shared = NetworkService()
    
    private init() {}
    
    func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 2) {
            let isValid = email == "test@test.com" && password == "test"
            completion(isValid)
        }
    }
    
    func logout(completion: @escaping () -> Void) {
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 2) {
            completion()
        }
    }
    
}
