//
//  BoardingScreen.swift
//  Vault
//
//  Created by Geetansh Atrey on 24/04/22.
//

import SwiftUI

struct BoardingScreen: Identifiable {
    var id = UUID().uuidString
    var image: String
    var description: String
}

// Titles
let descriptionForFirstScreen = """
Hey👋

Ever come across passwords like ‘password’, ‘123456’ or ‘abcdefg’?

Precisely why we need something called Two-Factor Authentication.
"""

let descriptionForSecondScreen = """
Imagine you’re a bad person who steals people’s money 😈

And you see this.
"""

let descriptionForThirdScreen = """
Just passwords aren’t good enough 🚫

With ever increasing frauds happening all around we need something stronger and more secure to protect our valuables.
"""

let descriptionForFourthScreen = """
Enter Two-Factor Authentication aka 2FA 🔒

With 2FA, after username and password, you need one more piece of information to enter the application. It can be a question, a key, an OTP, your biometric, etc.
"""

// Image names and BG Colors

// Sample Model Screens
var boardingScreens: [BoardingScreen] = [
    BoardingScreen(image: "firstOnboardingScreen", description: descriptionForFirstScreen),
    BoardingScreen(image: "secondOnboardingScreen", description: descriptionForSecondScreen),
    BoardingScreen(image: "thirdOnboardingScreen", description: descriptionForThirdScreen),
    BoardingScreen(image: "fourthOnboardingScreen", description: descriptionForFourthScreen)
]
