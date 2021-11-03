//
//  Dream.swift
//  dreams
//
//  Created by Alina Potapova on 20.10.2021.
//

import Foundation
import CoreData

extension Dream {
    convenience init(
        id: UUID = UUID(),
        date: Date = Date(),
        note: String,
        quality: Int16,
        duration: Double,
        context: NSManagedObjectContext
    ) {
        self.init(context: context)
        self.id = id
        self.date = date
        self.note = note
        self.quality = quality
        self.duration = duration
    }
    
//    var safeDateContent: Date {
//        get { date ?? Date() }
//        set { date = newValue }
//    }
//
//    var safeTextContent: String {
//        get { text ?? "" }
//        set { text = newValue }
//    }
//
//    var safePlaceContent: String {
//        get { place ?? "" }
//        set { place = newValue }
//    }
//
//    var safeID: UUID {
//        get { id ?? UUID() }
//        set { id = newValue }
//    }
//
//    var safeDate: String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd.MM.yyyy, EE"
//        return formatter.string(from: safeDateContent)
//    }
//
//    var safeNavDate: String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd.MM.yyyy"
//        return formatter.string(from: safeDateContent)
//    }
//
//    var safeText: String {
//        return safeTextContent != ""
//                ? String(safeTextContent.split(whereSeparator: \.isNewline)[0])
//                : "Something"
//    }
//
//    var safePlace: String {
//        return safePlaceContent != ""
//                ? String(safePlaceContent.split(whereSeparator: \.isNewline)[0])
//                : "Somewhere"
//    }
//
//    var contentWithoutTitle: String {
//        let splitContent = safeTextContent.split(whereSeparator: \.isNewline)
//        return safeTextContent != ""
//                ? splitContent[1..<splitContent.count].joined(separator: "\n")
//                : "Add some text"
//    }
}
