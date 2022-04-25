//
//  VaultListView.swift
//  Vault
//
//  Created by Geetansh Atrey on 24/04/22.
//

import SwiftUI

struct VaultListView: View {
    
    @State var isTimerActive = false
    @State private var isShowingScanner = false
    @State var otpData: [OtpModel] = [
        OtpModel(secretKey: SecretKeysData().getSecretKeyOfWalletIndex(index: 0), title: "MyCrypto Wallet", otpValue: "* * * * * *", timeLeftForProgressBar: CGFloat(AuthenticatorForVault().twoFactorAuthenticator(secretKey: SecretKeysData().getSecretKeyOfWalletIndex(index: 0)).1 / 60)),
        
        OtpModel(secretKey: SecretKeysData().getSecretKeyOfWalletIndex(index: 1), title: "YouPay Wallet", otpValue: "* * * * * *",timeLeftForProgressBar: CGFloat(AuthenticatorForVault().twoFactorAuthenticator(secretKey: SecretKeysData().getSecretKeyOfWalletIndex(index: 1)).1 / 60)),
        
        OtpModel(secretKey: SecretKeysData().getSecretKeyOfWalletIndex(index: 2), title: "Stonkup Wallet", otpValue: "* * * * * *", timeLeftForProgressBar: CGFloat(AuthenticatorForVault().twoFactorAuthenticator(secretKey: SecretKeysData().getSecretKeyOfWalletIndex(index: 2)).1 / 60))
    ]
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Time Based OTPs")
                .font(Font.custom("gill sans", size: 24))
                .foregroundColor(Color.black)
                .fontWeight(.semibold)
                .padding()
            
            List(otpData, id: \.id) { otp in
                
                VStack(alignment: .leading) {
                    Text(otp.title)
                        .font(Font.custom("gill sans", size: 16))
                        .foregroundColor(Color.black.opacity(0.7))
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(String(otp.otpValue))
                                .font(Font.custom("gill sans", size: 40))
                                .foregroundColor(Color("mainColor"))
                                .fontWeight(.semibold)
                                .lineLimit(2)
                        }
                        
                        Spacer()
                        
                        ZStack {
                            Circle()
                                .stroke(Color.white, lineWidth: 10)
                                .opacity(0.1)
                                .frame(width: 30, height: 30)
                            Circle()
                                .trim(from: 0, to: otp.timeLeftForProgressBar)
                                .stroke(Color.blue, lineWidth: 10)
                                .rotationEffect(.degrees(-90))
                                .frame(width: 30, height: 30)
                            
                            
                        }
                        .padding(.trailing, 50)
                    }
                    .padding(.bottom, 10)
                    
                }
                
            }
            .listStyle(PlainListStyle())
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image("vaultLogoForHeader")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .padding()
                    }
                }
            }
            .onAppear {
                isTimerActive = true
                startTimer()
            }
            .onDisappear {
                isTimerActive = false
            }
        }
    }
    
    func startTimer() {
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if isTimerActive == false {
                timer.invalidate()
            } else {
                updateOtpData()
            }
            
        }
    }
    
    func updateOtpData() {
        for i in 0..<otpData.count {
            let result = AuthenticatorForVault().twoFactorAuthenticator(secretKey: otpData[i].secretKey)
            otpData[i].otpValue = result.0
            otpData[i].timeLeftForProgressBar = CGFloat(Float(result.1)/60)
        }
    }
}
