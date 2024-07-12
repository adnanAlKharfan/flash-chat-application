# Flash Chat iOS Application


Flash Chat is a feature-rich iOS application designed to facilitate seamless chat experiences using Firebase. The application supports real-time messaging and integrates various Firebase services to ensure smooth and efficient communication.

## Table of Contents

- [Features](#Features)
- [Requirements](#Requirements)
- [Installation](#Installation)
- [Usage](#Usage)
- [File Structure](#File%20Structure)

## Features

- Real-time Messaging: Instant messaging with Firebase Firestore.

- User Authentication: Register and login with email and password using Firebase Auth.

- Custom UI: Unique chat bubble design for sender and receiver.

- Responsive Design: Auto-adjusting UI for different screen sizes.

## Requirements

- iOS 13.0+
- Xcode 11+
- A valid Firebase account

## Installation

1. Clone the Repository:

```bash
git clone https://github.com/adnanAlKharfan/flash-chat-application.git
cd flash-chat-application
```

2. Install Dependencies:

Open the project in Xcode. Make sure to install all required pods by navigating to the project directory and running:

```bash
pod install
```

3. Firebase Configuration:

    - Download the GoogleService-Info.plist file from your Firebase project.
      
    - Add the GoogleService-Info.plist file to the Flash Chat iOS13 directory in Xcode.

## Usage

1. Open the Project:

   Open the .xcworkspace file in Xcode.

```bash
open "Flash Chat iOS13.xcworkspace"
```
2. Build and Run:

   Select the target device/simulator and click on the build button in Xcode.

3. Register and Login:

    - Register with a new email and password.
      
    - Login with the registered credentials to start chatting.

## File Structure

The project is organized into the following main directories and files:

```plaintext
Flash Chat iOS13/
├── Controllers/
│   ├── ChatViewController.swift
│   ├── LoginViewController.swift
│   ├── RegisterViewController.swift
│   └── WelcomeViewController.swift
├── Models/
│   └── Message.swift
├── Views/
│   ├── MessageCell.swift
│   └── MessageCell.xib
├── Assets.xcassets/
├── Info.plist
├── AppDelegate.swift
├── SceneDelegate.swift
└── GoogleService-Info.plist
```

### Key Files

- AppDelegate.swift: Configures Firebase and keyboard manager on app launch.

- ChatViewController.swift: Handles chat functionalities and interactions with Firestore.
  
- LoginViewController.swift: Manages user login using Firebase Auth.
  
- RegisterViewController.swift: Manages user registration using Firebase Auth.
  
- WelcomeViewController.swift: Displays the welcome screen with navigation to login and register.
  
- Message.swift: Defines the message data model.

- MessageCell.swift & MessageCell.xib: Custom UI for displaying chat messages.



