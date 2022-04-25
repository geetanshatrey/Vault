//
//  AuthenticatorForVault.swift
//  Vault
//
//  Created by Geetansh Atrey on 24/04/22.
//

import CryptoKit
import SwiftUI

struct AuthenticatorForVault {
    
    func twoFactorAuthenticator(secretKey: String)->(String, Int) {
        let period = TimeInterval(60)
        let digits = 6
        let secret = Data(base64Encoded: secretKey)!
        var counter = UInt64(Date().timeIntervalSince1970 / period).bigEndian
        let timeLeft = Int(period) - Int(Date().timeIntervalSince1970) % Int(period)
        let counterData = withUnsafeBytes(of: &counter) { Array($0) }
        let hash = HMAC<Insecure.SHA1>.authenticationCode(for: counterData, using: SymmetricKey(data: secret))
        var truncatedHash = hash.withUnsafeBytes { ptr -> UInt32 in
            let offset = ptr[hash.byteCount - 1] & 0x0f
     
            let truncatedHashPtr = ptr.baseAddress! + Int(offset)
            return truncatedHashPtr.bindMemory(to: UInt32.self, capacity: 1).pointee
        }
        truncatedHash = UInt32(bigEndian: truncatedHash)
        truncatedHash = truncatedHash & 0x7FFF_FFFF
        truncatedHash = truncatedHash % UInt32(pow(10, Float(digits)))
        let stringHash = String(format: "%0*u", digits, truncatedHash)
        return (stringHash,timeLeft)
    }
}

