//
//  MessangingViewModel.swift
//  HandyMessenger
//
//  Created by Andrew Turkin on 3/14/18.
//  Copyright © 2018 Andrew Turkin. All rights reserved.
//

import Foundation

protocol MessangingViewModel {
    func fetchMessages()
    func sendMessage(_ message: String)
    func deleteMessage(_ message: Message)
    weak var delegate: MessagingViewModelDelegate? {get set}
    var dataBinder: MessagingDataBinder {get set}
}

protocol MessagingViewModelDelegate: class {
    func viewModelDidStartUpdate(_ viewModel: MessangingViewModel)
    func viewModelDidEndUpdate(_ viewModel: MessangingViewModel)
}

let DefaultPageLimit: Int = 40
