///Users/admin/Documents/User interface development/VKApp/VKApp/VKApp
//  CustomView.swift
//  VKApp
//
//  Created by admin on 11/02/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

enum CellIdentifier: String {
    case defaultCell = "UITableViewCell"
    case groupsVKTableViewCell = "GroupsVKTableViewCell"
    case newsVKTableViewCell = "NewsVKTableViewCell"
    case viewModel2 = "viewModel2"
}

//class CustomView: UIView {
//
//    public func reload(viewModels: [BaseViewModel]) {
//        self.viewModels = viewModels
//        self.tableView?.reloadData()
//        self.collectionView?.reloadData()
//    }
//    
//    public func add(viewModel: BaseViewModel) {
//        self.viewModels.append(viewModel)
//        let indexPath = IndexPath(row: self.viewModels.count - 1, section: 0)
//        self.tableView?.beginUpdates()
//        self.tableView?.insertRows(at: [indexPath], with: .middle)
//        self.tableView?.endUpdates()
//    }
//    
//    public func setHeader(viewModel: VKAppHeaderViewModel) {
//        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 100))
//        label.text = viewModel.groupName
//        label.textAlignment = .center
//        label.font = UIFont.systemFont(ofSize: 30)
//        self.tableView?.tableHeaderView = label
//    }
//    
//    // MARK: -
//    
//    private var viewModels: [BaseViewModel] = []
//    
//    private weak var tableView: UITableView?
//    
//    private weak var collectionView: UICollectionView?
//
//    // MARK: - Init
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.customInit()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        self.customInit()
//    }
//    
//    private func customInit() {
//        self.addSubviews()
//    }
//    
//    // MARK: - Subview
//    
//    func addSubviews() {
//       self.addTableView()
//    //self.addCollectionView()
//    }
//    
//    func addCollectionView() {
//        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: CollectionViewLayout())
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        collectionView.backgroundColor = UIColor.white
//        self.addSubview(collectionView)
//        self.collectionView = collectionView
//        
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
//        
//        let groupsVKAppNib = UINib(nibName: "VKAppCollectionViewCell", bundle: nil)
//        collectionView.register(groupsVKAppNib, forCellWithReuseIdentifier: "VKAppCollectionViewCell")
//    }
//    
//    func addTableView() {
//        let tableView = UITableView()
//        tableView.delegate = self as UITableViewDelegate
//        tableView.dataSource = self as UITableViewDataSource
//        self.addSubview(tableView)
//        self.tableView = tableView
//        
//        tableView.tableFooterView = UIView(frame: CGRect.zero)
//        
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellIdentifier.defaultCell.rawValue)
//        tableView.register(TableViewCell2.self, forCellReuseIdentifier: CellIdentifier.viewModel2.rawValue)
//        
//        let groupsVKAppNib = UINib(nibName: "GroupsVKTableViewCell", bundle: nil)
//        tableView.register(groupsVKAppNib, forCellReuseIdentifier: CellIdentifier.groupsVKTableViewCell.rawValue)
//
//    }
//    
//    // MARK: - Layout
//    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        self.tableView?.frame = self.bounds
//        self.collectionView?.frame = self.bounds
//    }
//}
//
//
//extension CustomView: UICollectionViewDelegate {
//    
//    
//}
//
//extension CustomView: UICollectionViewDataSource {
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return self.viewModels.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if let viewModel = self.viewModels[indexPath.row] as? VKApplicationViewModel,
//            let groupsVKCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "VKAppCollectionViewCell", for: indexPath) as? VKAppCollectionViewCell {
//            groupsVKCollectionViewCell.setViewModel(viewModel: viewModel)
//            return groupsVKCollectionViewCell
//        }
//        let defaultCell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
//        
//        return defaultCell
//    }
//
//}
//
//class CollectionViewLayout: UICollectionViewLayout {
//    var cacheAttributes: [IndexPath : UICollectionViewLayoutAttributes] = [:]
//    
//    var cellHeight: CGFloat = 128
//    
//    var totalHeight: CGFloat = 0
//    
//    override func prepare() {
//        
//        guard let collectionView = self.collectionView else {
//            return
//        }
//        
//        let itemsCount = collectionView.numberOfItems(inSection: 0)
//        if itemsCount <= 0 {
//            return
//        }
//        
//        let fullWidth  = collectionView.frame.size.width
//        let smallWidth = collectionView.frame.size.width
//        
//        var x: CGFloat = 0
//        var y: CGFloat = 0
//
//            
//        for i in 0..<itemsCount {
//            let indexPath = IndexPath(row: i, section: 0)
//            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
//
//            if i % 3 == 0 {
//                attributes.frame = CGRect(x: x, y: y, width: fullWidth, height: cellHeight)
//                x = 0
//                y += cellHeight
//            } else if i % 3 == 1 {
//                attributes.frame = CGRect(x: x, y: y, width: smallWidth, height: cellHeight)
//                x += smallWidth
//            }  else if i % 3 == 2 {
//                attributes.frame = CGRect(x: x, y: y, width: smallWidth, height: cellHeight)
//                x = 0
//                y += cellHeight
//            }
//            
//            print("attributes.frame \(attributes.frame)")
//            
//            self.totalHeight = y
//            
//            self.cacheAttributes[indexPath] = attributes
//        }
//    }
//    
//    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
//        return self.cacheAttributes.values.filter({ (attributes: UICollectionViewLayoutAttributes) -> Bool in
//            return rect.intersects(attributes.frame)
//        })
//    }
//    
//    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
//        return self.cacheAttributes[indexPath]
//    }
//    
//    override var collectionViewContentSize: CGSize {
//        return CGSize(width: self.collectionView?.frame.size.width ?? 0, height: self.totalHeight)
//    }
//}
//
//
//
//    extension CustomView: UITableViewDelegate {
//        
//    }
//    
//    extension CustomView: UITableViewDataSource {
//        
//        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            return self.viewModels.count
//        }
//        
//        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            if let viewModel = self.viewModels[indexPath.row] as? VKApplicationViewModel,
//               let groupsVKTableViewCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.groupsVKTableViewCell.rawValue, for: indexPath) as? GroupsVKTableViewCell {
//                groupsVKTableViewCell.setViewModel(viewModel: viewModel)
//                return groupsVKTableViewCell
//            } else if let viewModel = self.viewModels[indexPath.row] as? ViewModel2,
//                let cell2 = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.viewModel2.rawValue, for: indexPath) as? TableViewCell2 {
//                return cell2
//            } else {
//                   let defaultCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.defaultCell.rawValue, for: indexPath)
//                   defaultCell.textLabel?.text = "\(indexPath)"
//                   return defaultCell
//        }
//    }
//}
