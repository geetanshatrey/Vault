//
//  WalletModel.swift
//  Vault
//
//  Created by Geetansh Atrey on 24/04/22.
//

import SwiftUI


struct WalletModel: Identifiable {
    let id = UUID()
    let title: String
    let secretKey: String
    var isLocked: Bool
}
