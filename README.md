# Smile - iOS Social Media App

![Uploading IMG_7002.PNG…]()
![Uploading IMG_7003.PNG…]()


## Overview
Smile is a modern iOS social media application built with SwiftUI and Firebase. It offers real-time social interactions, image sharing, and user engagement features in a clean, intuitive interface.

## Features
- 📱 Native iOS app built with SwiftUI
- 🔐 Secure user authentication
- 📸 Image sharing with custom caching
- 👥 User profiles and social interactions
- 💬 Real-time comments and likes
- 🏷️ User tagging in posts
- 🔍 User search functionality
- 👥 Group creation and management
- 🎨 Dark mode support

## Technical Stack
- **Frontend:** SwiftUI
- **Backend:** Firebase (Authentication, Firestore, Storage)
- **Architecture:** MVVM (Model-View-ViewModel)
- **Dependencies:** Firebase SDK

## Requirements
- iOS 16.4+
- Xcode 14.0+
- Swift 5.0+
- CocoaPods or Swift Package Manager

## Installation
1. Clone the repository
```bash
git clone https://github.com/dding123/Smile.git
```

2. Install dependencies via Swift Package Manager (in Xcode)
- File → Swift Packages → Update to Latest Package Versions

3. Setup Firebase
- Create a new Firebase project at [Firebase Console](https://console.firebase.google.com)
- Download `GoogleService-Info.plist` and add it to your Xcode project
- Enable Authentication, Firestore, and Storage in Firebase Console

4. Build and run the project in Xcode

## Architecture
The app follows the MVVM (Model-View-ViewModel) architecture pattern with the following structure:

```
Smile/
├── Models/             # Data models
├── Views/              # SwiftUI views
├── ViewModels/         # View models
├── Services/           # Network and data services
├── Utils/             # Utility functions and extensions
└── Resources/         # Assets and resources
```

## Project Highlights
- **Custom Image Caching:** Efficient image loading and caching system
- **Real-time Updates:** Live data synchronization using Firebase
- **Clean Architecture:** Separation of concerns with MVVM pattern
- **Protocol-Oriented:** Extensive use of protocols for flexibility
- **Modern SwiftUI:** Leverages latest SwiftUI features
- **Responsive Design:** Adapts to different iOS devices

