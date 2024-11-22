//
//  Extensions.swift
//  Smile
//
//  Created by David Ding on 11/21/24.
//

import SwiftUI

extension View {
    func formattedDate(_ date: Date?) -> some View {
        let formattedString = DateFormattingHelper.shared.format(date: date)
        return Text(formattedString)
    }
    
    func cardStyle() -> some View {
        modifier(Theme.CardStyle())
    }
}
