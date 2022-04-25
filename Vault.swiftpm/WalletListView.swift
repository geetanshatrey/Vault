//
//  WalletListView.swift
//  Vault
//
//  Created by Geetansh Atrey on 24/04/22.
//

import SwiftUI

struct WalletListView: View {
    
    @State var toAppHome: Bool = false
    
    @State var walletData: [WalletModel] = [
        WalletModel(title: "MyCrypto Wallet", secretKey: SecretKeysData().getSecretKeyOfWalletIndex(index: 0),isLocked: true),
        WalletModel(title: "YouPay Wallet",secretKey: SecretKeysData().getSecretKeyOfWalletIndex(index: 1),isLocked: true),
        WalletModel(title: "Stonkup Wallet", secretKey: SecretKeysData().getSecretKeyOfWalletIndex(index: 2),isLocked: true)
    ]
    
    @State var navigateToOpenWallet0View: Bool = false
    @State var navigateToOpenWallet1View: Bool = false
    @State var navigateToOpenWallet2View: Bool = false
    
    var body: some View {
        
        ZStack {
            ScrollView {
                VStack(alignment: .leading) {
                    
                    Text("Wallet List")
                        .font(Font.custom("gill sans", size: 24))
                        .foregroundColor(Color.black)
                        .fontWeight(.semibold)
                        .padding()
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            VStack {
                                
                                if(navigateToOpenWallet0View == true) {
                                    
                                    VStack {
                                        Spacer()
                                        Image("mycryptoWallet")
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                        UnlockView(selectedWallet: walletData[0])
                                            .padding(.leading, 0)
                                        
                                        
                                        Button {
                                            navigateToOpenWallet0View  = false
                                        } label: {
                                            Text("Dismiss")
                                                .fontWeight(.semibold)
                                                .frame(maxWidth: .infinity)
                                        }
                                        
                                        Spacer()
                                    }
                                    
                                }
                                else {
                                    Image("mycryptoWallet")
                                        .resizable()
                                        .frame(width: 200, height: 200)
                                    
                                    Button(action: {
                                        navigateToOpenWallet0View.toggle()
                                        
                                    }) {
                                        
                                        VStack {
                                            HStack {
                                                Image(systemName: "lock.open.fill")
                                                    .foregroundColor(Color.white)
                                                Text("Unlock")
                                                    .foregroundColor(Color.white)
                                                    .font(Font.custom("gill sans", size: 18))
                                            }
                                        }
                                        .multilineTextAlignment(.center)
                                    }
                                    .frame(width: 120, height: 50)
                                    .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .fill(Color("mainColor"))
                                        .shadow(radius: 5))
                                    .padding(10)
                                    .buttonStyle(PlainButtonStyle())
                                }
                                
                            }
                            .multilineTextAlignment(.center)
                        }
                        .frame(width: 320, height: 350)
                        .background(RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color.white)
                            .shadow(radius: 10))
                        .padding(.bottom, 30)
                        .buttonStyle(PlainButtonStyle())
                        
                        Spacer()
                    }
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            VStack {
                                
                                if(navigateToOpenWallet1View == true) {
                                    
                                    VStack {
                                        Spacer()
                                        Image("youpayWallet")
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                        UnlockView(selectedWallet: walletData[1])
                                            .padding(.leading, 0)
                                        
                                        
                                        Button {
                                            navigateToOpenWallet1View  = false
                                        } label: {
                                            Text("Dismiss")
                                                .fontWeight(.semibold)
                                                .frame(maxWidth: .infinity)
                                        }
                                        
                                        Spacer()
                                    }
                                    
                                }
                                else {
                                    Image("youpayWallet")
                                        .resizable()
                                        .frame(width: 200, height: 200)
                                    
                                    Button(action: {
                                        navigateToOpenWallet1View.toggle()
                                    }) {
                                        
                                        VStack {
                                            HStack {
                                                Image(systemName: "lock.open.fill")
                                                    .foregroundColor(Color.white)
                                                Text("Unlock")
                                                    .foregroundColor(Color.white)
                                                    .font(Font.custom("gill sans", size: 18))
                                            }
                                            
                                        }
                                        .multilineTextAlignment(.center)
                                    }
                                    .frame(width: 120, height: 50)
                                    .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .fill(Color("mainColor"))
                                        .shadow(radius: 5))
                                    .padding(10)
                                    .buttonStyle(PlainButtonStyle())
                                }
                                
                            }
                            .multilineTextAlignment(.center)
                        }
                        .frame(width: 320, height: 350)
                        .background(RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color.white)
                            .shadow(radius: 10))
                        .padding(.bottom, 30)
                        .buttonStyle(PlainButtonStyle())
                        
                        Spacer()
                    }
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            VStack {
                                
                                if(navigateToOpenWallet2View == true) {
                                    
                                    VStack {
                                        Spacer()
                                        Image("stonkupWallet")
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                        UnlockView(selectedWallet: walletData[2])
                                            .padding(.leading, 0)
                                        
                                        Button {
                                            navigateToOpenWallet2View  = false
                                        } label: {
                                            Text("Dismiss")
                                                .fontWeight(.semibold)
                                                .frame(maxWidth: .infinity)
                                        }
                                        
                                        Spacer()
                                    }
                                    
                                }
                                else {
                                    Image("stonkupWallet")
                                        .resizable()
                                        .frame(width: 200, height: 200)
                                    
                                    Button(action: {
                                        navigateToOpenWallet2View.toggle()
                                    }) {
                                        VStack {
                                            HStack {
                                                Image(systemName: "lock.open.fill")
                                                    .foregroundColor(Color.white)
                                                Text("Unlock")
                                                    .foregroundColor(Color.white)
                                                    .font(Font.custom("gill sans", size: 18))
                                            }
                                        }
                                        .multilineTextAlignment(.center)
                                    }
                                    .frame(width: 120, height: 50)
                                    .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .fill(Color("mainColor"))
                                        .shadow(radius: 5))
                                    .padding(10)
                                    .buttonStyle(PlainButtonStyle())
                                }
                                
                            }
                            .multilineTextAlignment(.center)
                        }
                        .frame(width: 320, height: 350)
                        .background(RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color.white)
                            .shadow(radius: 10))
                        .padding(.bottom, 30)
                        .buttonStyle(PlainButtonStyle())
                        
                        Spacer()
                    }
                    
                    Spacer()
                    
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Image("walletLogoForHeader")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .padding()
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .statusBar(hidden: true)
        .onAppear {
            navigateToOpenWallet0View = false
            navigateToOpenWallet1View = false
            navigateToOpenWallet2View = false
            
        }
    }
    
}
