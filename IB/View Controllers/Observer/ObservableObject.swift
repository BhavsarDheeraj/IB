//
//  ObservableObject.swift
//  IB
//
//  Created by Dheeraj Bhavsar on 30/12/24.
//

final class ObservableObject<T> {
    var value: T? {
        didSet {
            listener?(value)
        }
    }
    
    private var listener: ((T?) -> Void)?
    
    init(_ value: T?) {
        self.value = value
    }
    
    func bind(_ listener: @escaping(T?) -> Void) {
        self.listener = listener
        listener(value)
    }
}
