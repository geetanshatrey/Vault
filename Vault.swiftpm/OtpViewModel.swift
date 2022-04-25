//
//  OtpViewModel.swift
//  Vault
//
//  Created by Geetansh Atrey on 24/04/22.
//

import SwiftUI

class OTPViewModel: ObservableObject {
    @Published var otpText: String = ""
    @Published var otpFields: [String] = Array(repeating: "", count: 6)
}
