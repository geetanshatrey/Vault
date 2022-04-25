//
//  OnboardingView.swift
//  Vault
//
//  Created by Geetansh Atrey on 24/04/22.
//

import SwiftUI

struct OnboardingView: View {
    
    @State var navigateToAppDashboard = false
    @State var offset: CGFloat = 0
    
    var body: some View {
        ZStack {
            if navigateToAppDashboard == false {
                OffsetPageTabView(offset: $offset) {
                    HStack(spacing: 0) {
                        ForEach(boardingScreens) { screen in
                            VStack(spacing: 15) {
                                Image(screen.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: getScreenBounds().width - 50, height: getScreenBounds().width - 50)
                                    .scaleEffect(getScreenBounds().height < 750 ? 0.9:  1)
                                    .offset(y: getScreenBounds().height < 750 ? -100:  -120)
                                    .padding(.bottom, 20)
                                
                                VStack(alignment: .leading, spacing: 12) {
                                    
                                    Text(screen.description)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                        .font(Font.custom("gill sans", size: 16))
                                    
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.trailing, 10)
                            }
                            .padding()
                            .frame(width: getScreenBounds().width)
                            .frame(maxHeight: .infinity)
                        }
                    }
                }
                .background(
                    RoundedRectangle(cornerRadius: 120)
                        .fill(.white)
                        .frame(width: getScreenBounds().width - 100, height: getScreenBounds().width - 100)
                        .scaleEffect(2)
                        .rotationEffect(.init(degrees: 25))
                        .rotationEffect(.init(degrees: getRotation()))
                        .offset(y: -getScreenBounds().width + 150)
                    , alignment: .leading
                )
                .background(Color("mainColor")).animation(.easeInOut, value: getIndex())
                .ignoresSafeArea(.container, edges: .all)
                .overlay(
                    VStack {
                        HStack {
                            Button {
                                navigateToAppDashboard = true
                            } label: {
                                Text("Skip")
                                    .font(Font.custom("gill sans", size: 16))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            
                            // Indicators
                            HStack(spacing: 8) {
                                ForEach(boardingScreens.indices, id: \.self) {index in
                                    Circle()
                                        .fill(.white)
                                        .opacity(index == (getIndex()) ? 1 : 0.4)
                                        .frame(width: 8, height: 8)
                                        .scaleEffect(index == (getIndex()) ? 1.3 : 0.85)
                                        .animation(.easeInOut, value: getIndex())
                                }
                            }
                            .frame(maxWidth: .infinity)
                            
                            Button {
                                if offset == getScreenBounds().width*3 {
                                    navigateToAppDashboard = true
                                }
                                offset = min(offset + getScreenBounds().width, getScreenBounds().width * 3)
                                
                                
                            } label: {
                                if offset < getScreenBounds().width*3 {
                                    Text("Next")
                                        .fontWeight(.bold)
                                        .font(Font.custom("gill sans", size: 16))
                                        .foregroundColor(.white)
                                } else {
                                    Text("Get Started")
                                        .fontWeight(.bold)
                                        .font(Font.custom("gill sans", size: 16))
                                        .foregroundColor(.white)
                                }
                                
                            }
                        }
                        .padding(.top, 30)
                        .padding(.horizontal, 8)
                    }
                    .padding()
                    ,alignment: .bottom
                    
                )
            } else {
                AppDashboardView()
            }
        }.transition(.slide)
        
    }
 
    func getRotation()->Double {
        let progress = offset/(getScreenBounds().width * 4)
        
        // Doing one full rotation
        let rotation = Double(progress) * 360
        return rotation
    }

    func getIndex()->Int {
        let progress = (offset / getScreenBounds().width).rounded()
        return Int(progress)
    }
}

extension View {
    func getScreenBounds()->CGRect {
        return UIScreen.main.bounds
    }
}
