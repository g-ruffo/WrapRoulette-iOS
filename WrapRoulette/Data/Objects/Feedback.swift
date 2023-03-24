//
//  Feedback.swift
//  WrapRoulette
//
//  Created by Grayson Ruffo on 2023-01-30.
//

import Foundation

struct Feedback {
    var message: String
    var date: Date
    var senderUid: String
    var senderName: String
    var senderEmail: String
    var resolved: Bool = false
    
    init(message: String, date: Date, senderUid: String, senderName: String, senderEmail: String, resolved: Bool) {
        self.message = message
        self.date = date
        self.senderUid = senderUid
        self.senderName = senderName
        self.senderEmail = senderEmail
        self.resolved = resolved
    }
}
