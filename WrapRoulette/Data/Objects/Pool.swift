//
//  Pool.swift
//  WrapRoulette
//
//  Created by Grayson Ruffo on 2023-01-30.
//

import Foundation

struct Pool {
    var docId: String
    var adminUid: String
    var adminName: String
    var adminProfileImage: String?
    var production: String
    var password: String
    var date: String
    var betAmount: String?
    var margin: String?
    var lockTime: Date?
    var startTime: Date?
    var endTime: Date?
    var winners: Array<Member> = []
    var users: [String: Bool] = [:]
    var pIRRulesEnabled: Bool = false
    var bets: [String: Date] = [:]
    
    init(docId: String, adminUid: String, adminName: String, adminProfileImage: String? = nil, production: String, password: String, date: String, betAmount: String? = nil, margin: String? = nil, lockTime: Date? = nil, startTime: Date? = nil, endTime: Date? = nil, winners: Array<Member>, users: [String : Bool], pIRRulesEnabled: Bool, bets: [String : Date]) {
        self.docId = docId
        self.adminUid = adminUid
        self.adminName = adminName
        self.adminProfileImage = adminProfileImage
        self.production = production
        self.password = password
        self.date = date
        self.betAmount = betAmount
        self.margin = margin
        self.lockTime = lockTime
        self.startTime = startTime
        self.endTime = endTime
        self.winners = winners
        self.users = users
        self.pIRRulesEnabled = pIRRulesEnabled
        self.bets = bets
    }
    
    
}
