//
//  Message.swift
//  WrapRoulette
//
//  Created by Grayson Ruffo on 2023-01-30.
//

import Foundation

struct Message {
    var text: String
    var time: Date
    var senderUid: String
    var senderName: String
    var profilePicture: String?
    var messageUid: String
    
    init(text: String, time: Date, senderUid: String, senderName: String, profilePicture: String? = nil, messageUid: String) {
        self.text = text
        self.time = time
        self.senderUid = senderUid
        self.senderName = senderName
        self.profilePicture = profilePicture
        self.messageUid = messageUid
    }
}
