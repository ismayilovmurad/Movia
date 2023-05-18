//
//  DataFetchPhase.swift
//  Movia
//
//  Created by Murad Ismayilov on 11.05.23.
//

import Foundation

enum DataFetchPhase<V> {
    
    case empty
    case success(V)
    case failure(Error)
    
    var value: V? {
        if case .success(let value) = self {
            return value
        }
        return nil
    }
    
}
