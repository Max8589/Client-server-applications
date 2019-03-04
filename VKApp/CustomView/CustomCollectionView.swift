//
//  CustomCollectionView.swift
//  VKApp
//
//  Created by admin on 14/02/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class CustomCollectionView: UIView {
    
    public func reload(viewModels: [BaseViewModel]) {
        self.viewModels = viewModels
        self.collectionView?.reloadData()
    }
    
    // MARK: -
    
    private var viewModels: [BaseViewModel] = []
    
    private weak var collectionView: UICollectionView?
    
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
        self.addCollectionView()
    }
    
    func addCollectionView() {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: CollectionViewLayout1())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.white
        self.addSubview(collectionView)
        self.collectionView = collectionView
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
        
        let groupsVKAppNib = UINib(nibName: "VKAppCollectionViewCell", bundle: nil)
        collectionView.register(groupsVKAppNib, forCellWithReuseIdentifier: "VKAppCollectionViewCell")
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.collectionView?.frame = self.bounds
    }
}


extension CustomCollectionView: UICollectionViewDelegate {
    
    
}

extension CustomCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let viewModel = self.viewModels[indexPath.row] as? VKApplicationViewModel,
            let groupsVKCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "VKAppCollectionViewCell", for: indexPath) as? VKAppCollectionViewCell {
            groupsVKCollectionViewCell.setViewModel(viewModel: viewModel)
            return groupsVKCollectionViewCell
        }
        let defaultCell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
        
        return defaultCell
    }
    
}

class CollectionViewLayout1: UICollectionViewLayout {
    var cacheAttributes: [IndexPath : UICollectionViewLayoutAttributes] = [:]
    
    var cellHeight: CGFloat = 128
    
    var totalHeight: CGFloat = 0
    
    override func prepare() {
        
        guard let collectionView = self.collectionView else {
            return
        }
        
        let itemsCount = collectionView.numberOfItems(inSection: 0)
        if itemsCount <= 0 {
            return
        }
        
        let fullWidth  = collectionView.frame.size.width
        //   let smallWidth = collectionView.frame.size.width
        
        var x: CGFloat = 0
        var y: CGFloat = 0
        
        for i in 0..<itemsCount {
            let indexPath = IndexPath(row: i, section: 0)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = CGRect(x: x, y: y, width: fullWidth, height: fullWidth)
            y += fullWidth
            
            print("attributes.frame \(attributes.frame)")
            
            self.totalHeight = y
            
            self.cacheAttributes[indexPath] = attributes
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return self.cacheAttributes.values.filter({ (attributes: UICollectionViewLayoutAttributes) -> Bool in
            return rect.intersects(attributes.frame)
        })
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return self.cacheAttributes[indexPath]
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: self.collectionView?.frame.size.width ?? 0, height: self.totalHeight)
    }
}
