//
//  WalletUnlockView.swift
//  Vault
//
//  Created by Geetansh Atrey on 24/04/22.
//

import SwiftUI
import CryptoKit

struct UnlockView: View {
    let selectedWallet: WalletModel
    
    @StateObject var otpModel: OTPViewModel = .init()
    @FocusState var activeField: OTPField?
    @State var isShowingAlert: Bool = false
    @State var navigateToUnlockWallet: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Enter the OTP :")
                .font(Font.custom("gill sans", size: 16))
                .foregroundColor(Color.black)
                .fontWeight(.semibold)
                .padding(.leading, 10)
            
            OtpField().padding(.bottom, 10)
            
            NavigationLink(destination: WalletUnlockedView(selectedWallet: selectedWallet), isActive: $navigateToUnlockWallet) {
                Button {
                    otpModel.otpText = ""
                    for i in 0..<6 {
                        otpModel.otpText += otpModel.otpFields[i]
                    }
                    if verifyOtp(otpText: otpModel.otpText) {
                        navigateToUnlockWallet = true
                    }
                    else {
                        isShowingAlert = true
                    }
                } label: {
                    Text("Verify")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .frame(maxWidth: .infinity)
                        .background {
                            RoundedRectangle(cornerRadius: 10, style: .continuous).fill(Color("mainColor"))
                        }
                }
                .alert("Wrong OTP ❌\n\nPlease check again.", isPresented: $isShowingAlert) {
                    Button("OK", role: .cancel) { }
                }
                .disabled(checkStates())
                .opacity(checkStates() ? 0.4 : 1)
            }
            .padding([.trailing, .leading], 10)
            .disabled(checkStates())
            
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .onChange(of: otpModel.otpFields) {
            newValue in
            OtpCondition(value: newValue)
        }
        
    }
    
    func checkStates()->Bool {
        for index in 0..<6 {
            if otpModel.otpFields[index].isEmpty {
                return true
            }
        }
        return false
    }
    
    // Conditions for Custom OTP Field & Limiting Only one text
    func OtpCondition(value: [String]) {
        
        // Moving next field if current field type
        for index in 0..<5 {
            if value[index].count == 1 && activeStateForIndex(index: index) == activeField {
                activeField = activeStateForIndex(index: index + 1)
            }
        }
        
        // Moving back if current is empty and previous is not empty
        for index in 1...5 {
            if value[index].isEmpty && !value[index - 1].isEmpty {
                activeField = activeStateForIndex(index: index - 1)
            }
        }
        
        for index in 0..<6 {
            if value[index].count > 1 {
                otpModel.otpFields[index] = String(value[index].last!)
            }
        }
    }
    
    // Custom OTP Text
    @ViewBuilder
    func OtpField()->some View {
        HStack(spacing: 10) {
            ForEach(0..<6, id: \.self) {
                index in
                VStack(spacing: 8) {
                    TextField("", text: $otpModel.otpFields[index])
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .multilineTextAlignment(.center)
                        .focused($activeField, equals: activeStateForIndex(index: index))
                    
                    Rectangle()
                        .fill(activeField == activeStateForIndex(index: index) ? .blue : .gray.opacity(0.3))
                        .frame(height: 3)
                }
                .frame(width: 40)
            }
        }
        .padding([.leading, .trailing], 10)
    }
    
    func activeStateForIndex(index: Int)->OTPField {
        switch index {
        case 0: return .field1
        case 1: return .field2
        case 2: return .field3
        case 3: return .field4
        case 4: return .field5
        default: return .field6
        }
    }
    
    func verifyOtp(otpText: String)->Bool {
        if(otpText == AuthenticatorForWallets().twoFactorAuthenticator(secretKey: selectedWallet.secretKey).0) {
            return true
        }
        return false
    }
}


// FocusState Enum
enum OTPField {
    case field1
    case field2
    case field3
    case field4
    case field5
    case field6
}
