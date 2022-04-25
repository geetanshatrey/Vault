//
//  AppHomeView.swift
//  Vault
//
//  Created by Geetansh Atrey on 24/04/22.
//

import SwiftUI


struct AppHomeView: View {
    
    @State var shouldNavigateVaultListView: Bool = false
    @State var shouldNavigateToWalletListView: Bool = false
    @State private var tabBar: UITabBar! = nil
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("Home")
                .font(Font.custom("gill sans", size: 36))
                .foregroundColor(Color.black)
                .fontWeight(.semibold)
                .padding()
                .padding(.bottom, -10)
            
            HStack {
                Spacer()
                NavigationLink(destination: VaultListView(), isActive: $shouldNavigateVaultListView){
                    Button(action: {
                        shouldNavigateVaultListView = true
                    }) {
                        VStack {
                            Image("vaultLogoForAppHome")
                                .resizable()
                                .frame(width: 270, height: 180)
                                .cornerRadius(25)
                        }
                        .multilineTextAlignment(.center)
                    }
                    .frame(width: 270, height: 180)
                    .background(RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color.white)
                        .shadow(radius: 10))
                    .padding(20)
                    .buttonStyle(PlainButtonStyle())
                }
                .navigationViewStyle(StackNavigationViewStyle())
                
                Spacer()
            }
            
            HStack {
                Spacer()
                NavigationLink(destination: WalletListView(), isActive: $shouldNavigateToWalletListView) {
                    Button(action: {
                        shouldNavigateToWalletListView = true
                    }) {
                        VStack {
                            Image("walletLogoForAppHome")
                                .resizable()
                                .frame(width: 270, height: 180)
                                .cornerRadius(25)
                        }
                        .multilineTextAlignment(.center)
                    }
                    .frame(width: 270, height: 180)
                    .background(RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color.white)
                        .shadow(radius: 10))
                    .padding(20)
                    .buttonStyle(PlainButtonStyle())
                }
                .navigationViewStyle(StackNavigationViewStyle())
                Spacer()
            }
            
            Spacer()
            Text("For Swift Student Challenge demo purposes, the Wallets client app is also included in this app. Otherwise the Vault app is an independent Two Factor Authentication app.").font(Font.custom("gill sans", size: 14)).background(RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color("noteColor")).frame(width: 360 , height: 80)).padding(30)
            Spacer()
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .topLeading
        )
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
        
    }
    
}



