//
//  MessangingDataBinder.swift
//  HandyMessenger
//
//  Created by Andrew Turkin on 3/14/18.
//  Copyright © 2018 Andrew Turkin. All rights reserved.
//

import Foundation

// contains view comforming interface
protocol MessagingDataBinder {
    var numberOfItems: Int {get}
    func itemAtIndex(_ index: Int) -> RowItem
}

class WritingMessagingDataBinder: MessagingDataBinder {
    func itemAtIndex(_ index: Int) -> RowItem {
        if index == messages.count && moreDataAvailable {
            return .LoadMoreData
        }
        else {
            return .Message(messages.sorted()[index])
        }
    }
    
    var numberOfItems: Int { get{ return moreDataAvailable ? messages.count + 1 : messages.count } }
    var messages: Set<Message> = Set<Message>()
    var moreDataAvailable: Bool = false
    
    func union(_ newMessages: [Message]) {
        messages = Set(newMessages).union(messages)
    }
}

enum RowItem {
    case Message(Message)
    case LoadMoreData
}
