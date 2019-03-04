//
//  CustomTableView.swift
//  VKApp
//
//  Created by admin on 14/02/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class CustomTableView: UIView {
    
    public func reload(viewModels: [BaseViewModel]) {
        self.viewModels = viewModels
        self.tableView?.reloadData()
    }
    
    public func add(viewModel: BaseViewModel) {
        self.viewModels.append(viewModel)
        let indexPath = IndexPath(row: self.viewModels.count - 1, section: 0)
        self.tableView?.beginUpdates()
        self.tableView?.insertRows(at: [indexPath], with: .middle)
        self.tableView?.endUpdates()
    }
    
    public func setHeader(viewModel: VKAppHeaderViewModel) {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 100))
        label.text = viewModel.groupName
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        self.tableView?.tableHeaderView = label
    }
    
    // MARK: -
    
    private var viewModels: [BaseViewModel] = []
    
    private weak var tableView: UITableView?
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.customInit()
    }
    
    private func customInit() {
        self.addSubviews()
    }
    
    // MARK: - Subview
    
    func addSubviews() {
        self.addTableView()
    }
    
    func addTableView() {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        self.addSubview(tableView)
        self.tableView = tableView
        
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellIdentifier.defaultCell.rawValue)
        tableView.register(TableViewCell2.self, forCellReuseIdentifier: CellIdentifier.viewModel2.rawValue)
        
        let groupsVKAppNib = UINib(nibName: "GroupsVKTableViewCell", bundle: nil)
        tableView.register(groupsVKAppNib, forCellReuseIdentifier: CellIdentifier.groupsVKTableViewCell.rawValue)
        
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.tableView?.frame = self.bounds
    }
}


extension CustomTableView: UITableViewDelegate {
    
}

extension CustomTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let viewModel = self.viewModels[indexPath.row] as? VKApplicationViewModel,
            let groupsVKTableViewCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.groupsVKTableViewCell.rawValue, for: indexPath) as? GroupsVKTableViewCell {
            groupsVKTableViewCell.setViewModel(viewModel: viewModel)
            return groupsVKTableViewCell
        } else if let viewModel = self.viewModels[indexPath.row] as? ViewModel2,
            let cell2 = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.viewModel2.rawValue, for: indexPath) as? TableViewCell2 {
            return cell2
        } else {
            let defaultCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.defaultCell.rawValue, for: indexPath)
            defaultCell.textLabel?.text = "\(indexPath)"
            return defaultCell
        }
    }
}
