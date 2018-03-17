//
//  MockMessagingService.swift
//  HandyMessenger
//
//  Created by Andrew Turkin on 17.03.18.
//  Copyright © 2018 Andrew Turkin. All rights reserved.
//

import Foundation

class MockMessagingService {
    static let sharedService = MockMessagingService()
    
    var mockDirectMessages = (0...500).map({ Message(text: "Direct message: \($0)", id: $0, date: Date()) })
    var mockGroupMessages = (0...500).map({ Message(text: "Group message: \($0)", id: $0, date: Date()) })
    
    func fetchDirectMessages(offset: Int, limit: Int, completion: (_ messages: [Message], _ moreDataAvailable: Bool) -> Void) {
        completion(Array(mockDirectMessages[offset..<min(offset+limit, mockDirectMessages.count)]), offset + limit < mockGroupMessages.count)
    }
    
    func fetchGroupMessages(offset: Int, limit: Int, completion: (_ messages: [Message], _ moreDataAvailable: Bool) -> Void) {
        completion(Array(mockGroupMessages[offset..<min(offset+limit, mockGroupMessages.count)]), offset + limit < mockGroupMessages.count)
    }
    
    func sendDirectMessage(_ message: String, completion: (Message) -> Void) {
        let message = Message(text: message, id: mockDirectMessages.count+1, date: Date())
        mockDirectMessages += [message]
        completion(message)
    }
    
    func sendGroupMessage(_ message: String, completion: (Message) -> Void) {
        let message = Message(text: message, id: mockGroupMessages.count+1, date: Date())
        mockGroupMessages += [message]
        completion(message)
    }
    
    func deleteDirectMessage(_ messageId: Int, completion: () -> Void) {
        if let message = mockDirectMessages.filter({$0.id == messageId}).first,
           let index = mockDirectMessages.index(of: message){
            mockDirectMessages.remove(at: index)
            completion()
        }
    }
    
    func deleteGroupMessage(_ messageId: Int, completion: () -> Void) {
        if let message = mockGroupMessages.filter({$0.id == messageId}).first,
            let index = mockGroupMessages.index(of: message){
            mockGroupMessages.remove(at: index)
            completion()
        }
    }
}
