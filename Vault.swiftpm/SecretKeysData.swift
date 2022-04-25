//
//  SecretKeysData.swift
//  Vault
//
//  Created by Geetansh Atrey on 24/04/22.
//

import SwiftUI


struct SecretKeysData {
    let data = [
        "6UAOpz+x3dsNrQ==",
        "AylPpz+x3dsNrQ==",
        "C0p1pz+x3dsNrQ=="
    ]
    
    func getSecretKeyOfWalletIndex(index: Int)->String {
        return data[index]
    }
}
