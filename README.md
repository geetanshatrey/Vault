# Vault App
<p>
    <img src="GitHub Repo Assets/vaultHeader.png" height="350">
</p>

## About
Vault is a two factor authenticator app which generates time based OTPs(One Time Passwords). It uses the HMAC type of message authentication involving SHA1 cryptographic function. This is based on TOTP(Time based One Time Passwords) algorithm. 

## Steps for running the app
1. Download the Xcode 13.3 on macOS 12.3.
2. Clone this repository.
3. Open the Vault.swiftpm(Swift Playgrounds app project) using Xcode.
4. Build and run the app on iPhone 13 Pro Simulator(works on any other iOS device).

## Features

- The Vault app generates a new OTP every 60 seconds using the secret key of the respective wallet. It also contains a circular progress bar for each wallet showing the time left for that OTP to expire. 

- The Wallet app contains a list of wallets, each having a unique secret key. A wallet can be unlocked using the OTP for that respective wallet only. Thus it is secured by the Vault app. Once the wallet is unlocked, the user gets to the wallet details page. The wallet details page contains the portfolio for that respective wallet. 

- The project also contains the How It Works section. Here the user is presented with a horizontal carousel of cards which explain the working of Two Factor Authentication process. 

- The project has a very intuitive UI in each of its sections. It also has a touch of neumorphic UI with some of the cards having shadows as well as beautiful gradient colours as well as logos. 


## Technologies Used
![CryptoKit](https://img.shields.io/badge/-SwiftUI-black?style=for-the-badge&logo=swift&logoColor=blue)
![CryptoKit](https://img.shields.io/badge/-CryptoKit-blue?style=for-the-badge&logo=apple)
![Swift5](https://img.shields.io/badge/-Swift5-red?style=for-the-badge&logo=swift&logoColor=white)

