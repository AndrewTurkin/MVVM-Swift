//
//  ViewController.swift
//  HandyMessenger
//
//  Created by Andrew Turkin on 3/14/18.
//  Copyright © 2018 Andrew Turkin. All rights reserved.
//

import UIKit

class HandyMessageViewController: UITableViewController {
    var viewModel: HandyMessangerViewModel!
    let DefaultCellId = "DefaultCellId"
    let LoadMoreDataCellId = "LoadMoreDataCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: LoadMoreDataCellId)
        viewModel.delegate = self
        viewModel.fetchMessages()
    }
    
    // MARK: UITableView conformance
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.dataBinder.itemAtIndex(indexPath.row) {
        case .Message(let message):
            let cell = tableView.dequeueReusableCell(withIdentifier: DefaultCellId) ??
                       UITableViewCell(style: .value1, reuseIdentifier: DefaultCellId)
            cell.textLabel?.text = message.text
            cell.detailTextLabel?.text = message.date.string(with: "hh:mm:ss")
            return cell
        case .LoadMoreData:
            let cell = tableView.dequeueReusableCell(withIdentifier: LoadMoreDataCellId, for: indexPath)
            cell.textLabel?.text = "Loading more data..."
            viewModel.fetchMessages()
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataBinder.numberOfItems
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if case .Message(let message) = viewModel.dataBinder.itemAtIndex(indexPath.row) {
            let action: UIContextualAction = UIContextualAction(style: .destructive, title: "Delete", handler: { [weak self] (action, view, handler) in
                self?.viewModel.deleteMessage(message)
            })
            return UISwipeActionsConfiguration(actions: [action])
        }
        return nil
    }
}

extension HandyMessageViewController: HandyMessangerViewModelDelegate {
    func viewModelDidStartUpdate(_ viewModel: HandyMessangerViewModel) {
        // show progress
    }
    
    func viewModelDidEndUpdate(_ viewModel: HandyMessangerViewModel) {
        tableView.reloadData()
    }
}
