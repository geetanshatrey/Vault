# Vault App
<p>
    <img src="GitHub Repo Assets/vaultHeader.png" height="300">
</p>

## About
Vault is a two factor authenticator app which generates time based OTPs(One Time Passwords). It uses the HMAC type of message authentication involving SHA1 cryptographic function. This is based on TOTP(Time based One Time Passwords) algorithm. 

## Steps for running the app
1. Download the Xcode 13.3 on macOS 12.3.
2. Clone this repository.
3. Open the Vault.swiftpm(Swift Playgrounds app project) using Xcode.
4. Build and run the app on iPhone 13 Pro Simulator(works on any other iOS device).

## Project Components
For demonstration purposes, the project contains two sections in itself - the Vault app (which is the two factor authenticator app) and the Wallets app (which is a list of wallets, each having a secret key that is shared between the authenticator and the respective wallet). The Wallets app is a simulation of a generic wallet app, which are secured with 2 factor authentication. In order to open a wallet, the user would first need to go to the Vault app and check for the real time OTP(generated every 60 seconds). Then the user needs to enter that OTP in the wallet login screen. Entering the correct OTP would let them access the wallet details. 

## Features
- The Vault app generates a new OTP every 60 seconds using the secret key of the respective wallet. It also contains a circular progress bar for each wallet showing the time left for that OTP to expire. 

- The Wallet app contains a list of wallets, each having a unique secret key. A wallet can be unlocked using the OTP for that respective wallet only. Thus it is secured by the Vault app. Once the wallet is unlocked, the user gets to the wallet details page. The wallet details page contains the portfolio for that respective wallet. 

- The project also contains the How It Works section. Here the user is presented with a horizontal carousel of cards which explain the working of Two Factor Authentication process. 

- The project has a very intuitive UI in each of its sections. It also has a touch of neumorphic UI with some of the cards having shadows as well as beautiful gradient colours as well as logos. 

## App Walkthrough
**Onboarding**
- On entering the app, we first see the splash screen with the Vault app logo and it's description.
- Then we get to the Onboarding page tab views, where the app presents the purpose of Vault app and 2 factor authentication in form of a story.
- The user has the option to view all these tabs to get more information, or they could simply skip the entire flow.
- Here we see that on scrolling a tab, the user observes a wave effect in the User Interface. This was built using a rotation logic for RoundedRectangte element in SwiftUI.
- Overall this flow creates a smooth onboarding experience for a user, as well as gaining their interest towards the app!

**App Home**
- Moving on from the Onboarding, we get to the App Home section of the app.
- Here we see that there are 2 cards placed. One for the Vault app (2 factor authenticator) and second one for the Wallet app (List of Wallets which are secured by 2 factor authentication). Note: We have 2 different cards/parts of the app because of demonstration purposes.
- Clicking on any of this would take the user to the respective pages of the app.
- At the bottom we have a Tab Bar which has App Home selected. It has another tab for the How it Works section.
- Both the cards(Vault & the Wallet) have a beautiful neumorphic look with an aesthetic background as well as card shadow. The logo on the cards make it very easy for the user to understand the purpose of the card.

**Vault App**
- On clicking the Vault card on the App Home section, we get to the Vault(2 factor authenticator) page.
- Here we see the list of real time based OTPs of different wallets presented in form of a ListView in front of the user.
- Each of the List element has the wallet name at the top. Then it has the real time OTP in a larger text size. And on its side, it has a real time circular progress bar which shows the time left before this 0TP expires for a wallet. 
- At the top the NavigationBar has also been integrated, with the Vault app logo at the tab bar center and the Back button to navigate to the App Home.

**Wallet App**

**Let's try to Unlock a Wallet**

**Entering an Invalid OTP**

**How it Works Section**

## Technologies Used
![CryptoKit](https://img.shields.io/badge/-SwiftUI-black?style=for-the-badge&logo=swift&logoColor=blue)
![CryptoKit](https://img.shields.io/badge/-CryptoKit-blue?style=for-the-badge&logo=apple)
![Swift5](https://img.shields.io/badge/-Swift5-red?style=for-the-badge&logo=swift&logoColor=white)

