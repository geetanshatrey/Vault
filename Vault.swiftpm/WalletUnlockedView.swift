//
//  WalletUnlockedView.swift
//  Vault
//
//  Created by Geetansh Atrey on 24/04/22.
//

import SwiftUI

struct WalletUnlockedView: View {
    
    @State var selectedWallet: WalletModel
    @State var toWalletListView: Bool = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var btnBack : some View {
        
        Button(action: {
            WalletListView().navigateToOpenWallet0View = false
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "lock.fill")
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.red)
                Text("Lock")
                    .foregroundColor(Color.red)
                    .font(Font.custom("gill sans", size: 20))
                    .fontWeight(.medium)
                
            }
        }
        
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("Wallet Details")
                .font(Font.custom("gill sans", size: 30))
                .foregroundColor(Color.black)
                .fontWeight(.semibold)
                .padding()
            
            if(selectedWallet.title == "MyCrypto Wallet") {
                
                HStack {
                    Spacer()
                    VStack {
                        Image("mycryptoWalletDetailsCard")
                            .resizable()
                    }.frame(width: 300, height: 450)
                        .cornerRadius(20)
                        .shadow(radius: 5)
                    Spacer()
                }.padding()
                
            }
            else if(selectedWallet.title == "YouPay Wallet") {
                
                HStack {
                    Spacer()
                    VStack {
                        Image("youpayWalletDetailsCard")
                            .resizable()
                    }.frame(width: 300, height: 450)
                        .cornerRadius(20)
                        .shadow(radius: 5)
                    Spacer()
                }.padding()
            }
            else {
                
                HStack {
                    Spacer()
                    VStack {
                        Image("stonkupWalletDetailsCard")
                            .resizable()
                    }.frame(width: 300, height: 450)
                        .cornerRadius(20)
                        .shadow(radius: 5)
                    Spacer()
                }.padding()
            }
            
            Text("Your wallet is secured by 2 Factor Authentication using Time based OTPs.").font(Font.custom("gill sans", size: 14)).background(RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color("noteColor")).frame(width: 360 , height: 80).padding(10)).padding()
            
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(trailing: btnBack)
    }
}
