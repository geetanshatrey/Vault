//
//  CustomTabBarView.swift
//  Vault
//
//  Created by Geetansh Atrey on 24/04/22.
//

import SwiftUI

struct CustomTabBarView: View {
    
    @State var selectedTab = "house.fill"
    let tabs = ["house.fill", "questionmark.circle"]
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            
            TabView(selection: $selectedTab) {
                AppHomeView().tag("house.fill")
                
                HowItWorksView().tag("questionmark.circle")
            }
            
            HStack(spacing: 0) {
                ForEach(tabs, id: \.self) {
                    image in
                    TabButton(image: image, selectedTab: $selectedTab)
                    
                    if image != tabs.last {
                        Spacer(minLength: 0)
                    }
                }
            }
            .frame(width: 100, height: 50)
            .padding(.horizontal, 25)
            .padding(.vertical, 5)
            .background(Color.white)
            .clipShape(Capsule())
            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 5, y: 5)
            .shadow(color: Color.black.opacity(0.15), radius: 5, x: -5, y: -5)
            .padding(.horizontal)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct TabButton: View {
    var image: String
    @Binding var selectedTab: String
    
    var body: some View {
        Button {
            selectedTab = image
        } label: {
            
            HStack {
                Image(systemName: image)
                    .renderingMode(.template)
                    .foregroundColor(selectedTab == image ? Color.black : Color.black.opacity(0.2))
                    .padding()
                    .frame(width: 40, height: 40)
            }
            
        }
        
    }
}
