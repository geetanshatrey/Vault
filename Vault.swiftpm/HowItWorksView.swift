//
//  HowItWorksView.swift
//  Vault
//
//  Created by Geetansh Atrey on 24/04/22.
//

import SwiftUI

struct HowItWorksView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("How 2FA Works?")
                .font(Font.custom("gill sans", size: 36))
                .foregroundColor(Color.black)
                .fontWeight(.semibold)
                .padding(.leading,20)
                .padding(.bottom, 10)
            
            Text("Vault app is built using Apple's own CryptoKit.")
                .font(Font.custom("gill sans", size: 14))
                .foregroundColor(Color.black)
                .padding(.leading,20)
                .padding(.bottom, 10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    cardView(img: "firstHowItWorksCard").padding(6)
                    cardView(img: "secondHowItWorksCard").padding(6)
                    cardView(img: "thirdHowItWorksCard").padding(6)
                    cardView(img: "fourthHowItWorksCard").padding(6)
                    cardView(img: "fifthHowItWorksCard").padding(6)
                    cardView(img: "sixthHowItWorksCard").padding(6)
                }
            }
            .padding()
        }
    }
}

struct cardView: View {
    
    var img = ""
    
    var body: some View {
        VStack {
            Image(img)
                .resizable()
        }.frame(width: 300, height: 500)
            .cornerRadius(20)
    }
}
