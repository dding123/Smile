# Smile - iOS Social Media App

<img width="590" height="1278" alt="IMG_7002" src="https://github.com/user-attachments/assets/bd27b7c7-1ca3-4edd-b631-a7b3f1dbe517" />
<img width="590" height="1278" alt="IMG_7003" src="https://github.com/user-attachments/assets/3909c08c-a8df-48e2-9fb6-03cb7881fed3" />



## Overview
Smile is a friend-centered iOS social media application that transforms how we share memories by putting our loved ones at the center of every post. Built with SwiftUI and Firebase, Smile encourages users to upload and tag pictures of their friends rather than themselves, fostering genuine community connections and celebrating the people who matter most.

Unlike traditional social platforms focused on self-promotion, Smile creates a positive environment where users spotlight their friends, building stronger relationships through shared experiences and mutual appreciation. The app offers real-time social interactions, seamless image sharing with friend tagging, and engaging community features—all designed to strengthen bonds and create lasting memories together.

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

