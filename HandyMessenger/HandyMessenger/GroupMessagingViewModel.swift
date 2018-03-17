//
//  GroupMessagingViewModel.swift
//  HandyMessenger
//
//  Created by Andrew Turkin on 17.03.18.
//  Copyright © 2018 Andrew Turkin. All rights reserved.
//

import Foundation

class GroupMessagingViewModel: HandyMessangerViewModel {
    var dataBinder: DataBinder = WritingDataBinder()
    var writingBinder: WritingDataBinder { get{ return dataBinder as! WritingDataBinder } }
    var delegate: HandyMessangerViewModelDelegate?
    
    func deleteMessage(_ message: Message) {
        delegate?.viewModelDidStartUpdate(self)
        MockMessagingService.sharedService.deleteGroupMessage(message.id) {
            writingBinder.messages.remove(message)
            delegate?.viewModelDidEndUpdate(self)
        }
    }
    
    func fetchMessages() {
        delegate?.viewModelDidStartUpdate(self)
        MockMessagingService.sharedService.fetchGroupMessages(offset: writingBinder.messages.count, limit: DefaultPageLimit) { (messages, moreDataAvailable) in
            // data convertion should be here
            writingBinder.union(messages)
            writingBinder.moreDataAvailable = moreDataAvailable
            delegate?.viewModelDidEndUpdate(self)
        }
    }
    
    func sendMessage(_ message: String) {
        delegate?.viewModelDidStartUpdate(self)
        MockMessagingService.sharedService.sendGroupMessage(message) { (message) in
            writingBinder.union([message])
            delegate?.viewModelDidEndUpdate(self)
        }
    }
}
