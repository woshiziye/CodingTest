//
//  ClosureConfig.swift
//  CodingTest
//
//  Created by 子叶 on 2021/2/5.
//

import Foundation

public typealias TSValueClosure<Value> = (Value)->Void
public typealias TSNullClosure = ()->Void

public enum TSResult<Value0, Value1> {
    case success(Value0)
    case failure(Value1)
}

public enum TSValueResult<Value> {
    case success(Value)
    case failure(Value)
}

public enum TSSuccessResult<Value> {
    case success(Value)
    case failure
}

public enum TSFailureResult<Value> {
    case success
    case failure(Value)
}

public enum TSNullResult {
    case success
    case failure
}
