//
//  Theme.swift
//  Smile
//
//  Created by David Ding on 11/17/24.
//

import SwiftUI

enum Theme {
    enum Colors {
        static let brandPrimary = Color("BrandPrimary")
        static let brandSecondary = Color("BrandSecondary")
        static let background = Color("AppBackground")
        static let surface = Color("AppSurface")
        static let textPrimary = Color("BrandPrimary")
        static let textSecondary = Color("BrandSecondary")
    }
    
    enum Typography {
        static let titleLarge = Font.system(size: 24, weight: .bold)
        static let titleMedium = Font.system(size: 20, weight: .semibold)
        static let titleSmall = Font.system(size: 16, weight: .semibold)
        static let bodyLarge = Font.system(size: 16, weight: .regular)
        static let bodyMedium = Font.system(size: 14, weight: .regular)
        static let caption = Font.system(size: 12, weight: .regular)
    }
    
    enum Metrics {
        static let padding: CGFloat = 16
        static let cornerRadius: CGFloat = 12
        static let iconSize: CGFloat = 24
        static let avatarSize: CGFloat = 40
    }
    
    enum Animation {
        static let `default` = SwiftUI.Animation.easeInOut(duration: 0.2)
        static let spring = SwiftUI.Animation.spring(response: 0.3, dampingFraction: 0.7)
    }
}

// MARK: - View Modifiers
extension Theme {
    struct CardStyle: ViewModifier {
        func body(content: Content) -> some View {
            content
                .padding(Metrics.padding)
                .background(Colors.surface)
                .cornerRadius(Metrics.cornerRadius)
                .shadow(color: .black.opacity(0.05), radius: 8)
        }
    }
}

// MARK: - View Extensions
extension View {
    func cardStyle() -> some View {
        modifier(Theme.CardStyle())
    }
}
