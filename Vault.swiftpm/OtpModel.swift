//
//  OtpModel.swift
//  Vault
//
//  Created by Geetansh Atrey on 18/04/22.
//

import SwiftUI

struct OtpModel: Identifiable {
    let id = UUID()
    let secretKey: String
    let title: String
    var otpValue: String
    var timeLeftForProgressBar: CGFloat
}
