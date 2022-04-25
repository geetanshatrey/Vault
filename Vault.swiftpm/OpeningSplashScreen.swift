//
//  OpeningSplashScreen.swift
//  Vault
//
//  Created by Geetansh Atrey on 24/04/22.
//

import SwiftUI

struct OpeningSplashScreen: View {
    
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        
        if isActive {
            OnboardingView()
                .transition(.slide)
        } else {
            VStack {
                HStack {
                    Image("splashScreen")
                        .resizable()
                        .frame(width: 300, height: 300)
                        .font(.system(size: 80))
                        .foregroundColor(.red)
                }
                .padding(20)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    self.isActive = true
                }
            }
        }
        
    }
}
