//
//  MessangingViewModel.swift
//  HandyMessenger
//
//  Created by Andrew Turkin on 3/14/18.
//  Copyright © 2018 Andrew Turkin. All rights reserved.
//

import Foundation

protocol HandyMessangerViewModel {
    func fetchMessages()
    func sendMessage(_ message: String)
    func deleteMessage(_ message: Message)
    weak var delegate: HandyMessangerViewModelDelegate? {get set}
    var dataBinder: DataBinder {get set}
}

protocol HandyMessangerViewModelDelegate: class {
    func viewModelDidStartUpdate(_ viewModel: HandyMessangerViewModel)
    func viewModelDidEndUpdate(_ viewModel: HandyMessangerViewModel)
}

let DefaultPageLimit: Int = 40
