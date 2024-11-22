//
//  DateFormattingHelper.swift
//  Smile
//
//  Created by David Ding on 11/21/24.
//


import Foundation

struct DateFormattingHelper {
    static let shared = DateFormattingHelper()
    private let formatter: RelativeDateTimeFormatter
    private let absoluteFormatter: DateFormatter
    
    init() {
        formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .abbreviated
        
        absoluteFormatter = DateFormatter()
        absoluteFormatter.dateStyle = .medium
        absoluteFormatter.timeStyle = .short
    }
    
    func format(date: Date?) -> String {
        guard let date = date else { return "Unknown" }
        
        let now = Date()
        let difference = Calendar.current.dateComponents([.day], from: date, to: now)
        
        // If more than 7 days old, show absolute date
        if let days = difference.day, days > 7 {
            return absoluteFormatter.string(from: date)
        }
        
        // Otherwise show relative time
        return formatter.localizedString(for: date, relativeTo: now)
    }
}