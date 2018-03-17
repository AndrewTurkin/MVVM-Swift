//
//  MessangingDataBinder.swift
//  HandyMessenger
//
//  Created by Andrew Turkin on 3/14/18.
//  Copyright © 2018 Andrew Turkin. All rights reserved.
//

import Foundation

// contains view conforming interface
protocol DataBinder {
    var numberOfItems: Int {get}
    func itemAtIndex(_ index: Int) -> RowItem
}

class WritingDataBinder: DataBinder {
    var messages: Set<Message> = Set<Message>()
    var moreDataAvailable: Bool = false
    var numberOfItems: Int {
        get {
            return moreDataAvailable ? messages.count + 1 :
                                       messages.count
        }
    }
    func itemAtIndex(_ index: Int) -> RowItem {
        if index == messages.count && moreDataAvailable {
            return .LoadMoreData
        }
        else {
            return .Message(messages.sorted()[index])
        }
    }
    
    func union(_ newMessages: [Message]) {
        messages = Set(newMessages).union(messages)
    }
}

enum RowItem {
    case Message(Message)
    case LoadMoreData
}
