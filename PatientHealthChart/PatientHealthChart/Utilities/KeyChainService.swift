//
//  KeyChainService.swift
//  PatientHealthChart
//
//  Created by Jiayin Song on 11/17/22.
//

import Foundation
import KeychainSwift

class KeyChainService{
    var _keyChain = KeychainSwift()
    
    var keyChain: KeychainSwift {
        get {
            return _keyChain
        }
        set {
            _keyChain = newValue
        }
    }
    
}
