//
//  AppDashboardView.swift
//  Vault
//
//  Created by Geetansh Atrey on 24/04/22.
//

import SwiftUI

struct AppDashboardView: View {
    
    @State var selectedIndex = 0
    
    let icons = [
        "house",
        "questionmark.circle"
    ]
    
    var body: some View {
        
        NavigationView {
            CustomTabBarView()
                .navigationBarHidden(true)
        }
    }
}
