//
//  Message.swift
//  HandyMessenger
//
//  Created by Andrew Turkin on 17.03.18.
//  Copyright © 2018 Andrew Turkin. All rights reserved.
//

import Foundation

// domain specific model. it represents the data which we will actually show
struct Message {
    let text: String
    let id: Int
    let date: Date
}

extension Message: Hashable {
    var hashValue: Int {
        return id
    }
    
    static func ==(lhs: Message, rhs: Message) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Message: Comparable {
    static func <(lhs: Message, rhs: Message) -> Bool {
        return lhs.date < rhs.date
    }
}
