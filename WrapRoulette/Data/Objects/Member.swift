//
//  Member.swift
//  WrapRoulette
//
//  Created by Grayson Ruffo on 2023-01-30.
//

import Foundation


struct Member {
    var uid: String?
    var tempMemberUid: String?
    var poolId: String
    var displayName: String
    var email: String?
    var department: String?
    var bidTime: Date?
    var profilePicturePath: String?
    var winnings: Int
    var activeMember: Bool
    
    init(uid: String? = nil, tempMemberUid: String? = nil, poolId: String, displayName: String, email: String? = nil, department: String? = nil, bidTime: Date? = nil, profilePicturePath: String? = nil, winnings: Int, activeMember: Bool) {
        self.uid = uid
        self.tempMemberUid = tempMemberUid
        self.poolId = poolId
        self.displayName = displayName
        self.email = email
        self.department = department
        self.bidTime = bidTime
        self.profilePicturePath = profilePicturePath
        self.winnings = winnings
        self.activeMember = activeMember
    }
}
