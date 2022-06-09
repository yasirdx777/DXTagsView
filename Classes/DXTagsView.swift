//
//  DXTagView.swift
//  DXTagsView
//
//  Created by Yasir Romaya on 6/8/22.
//

import Foundation
import UIKit

public class DXTagsView: UIViewController {
    
    private var tagsCollection: DynamicCollectionView!
    private var tagViewConfig: DXTagViewConfig?
    
    public convenience init() {
        self.init(tagViewConfig: nil)
    }
    
    public init(tagViewConfig: DXTagViewConfig?) {
        self.tagViewConfig = tagViewConfig
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        createView()
    }
    
    private func createView(){
        self.view.backgroundColor = tagViewConfig?.tagViewBackgroundColor ?? .clear
        
        let layout = AlignedCollectionViewFlowLayout()
        
        layout.horizontalAlignment = tagViewConfig?.tagViewHorizontalAlignment ?? .left
        layout.verticalAlignment = tagViewConfig?.tagViewVerticalAlignment ?? .top
        
        layout.minimumLineSpacing = tagViewConfig?.tagViewMinimumLineSpacing ?? 8
        layout.minimumInteritemSpacing = tagViewConfig?.minimumInteritemSpacing ?? 8
        
        layout.scrollDirection = .vertical
        
        
        tagsCollection = DynamicCollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
        
        tagsCollection.register(DXTagView.self, forCellWithReuseIdentifier: "DXTagView")
        
        tagsCollection.showsHorizontalScrollIndicator = false
        tagsCollection.showsVerticalScrollIndicator = false
        tagsCollection.allowsMultipleSelection = true
        tagsCollection.backgroundColor = .clear
        
        
        self.view.addSubview(tagsCollection)
        
        tagsCollection.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate( [
            self.view.topAnchor.constraint(equalTo: tagsCollection.topAnchor, constant: -tagViewConfig!.tagsPadding),
            self.view.leadingAnchor.constraint(equalTo: tagsCollection.leadingAnchor, constant: -tagViewConfig!.tagsPadding),
            tagsCollection.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: tagViewConfig!.tagsPadding),
            tagsCollection.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: tagViewConfig!.tagsPadding)
        ])
        
        
        
        tagsCollection.delegate = self
        tagsCollection.dataSource = self
        
    }
    
    public func getSelectedIndexPaths() -> [IndexPath]? {
        return tagsCollection.indexPathsForSelectedItems
    }
    
    
}

extension DXTagsView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tagViewConfig?.tagsConfig?.count ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DXTagView", for: indexPath) as! DXTagView
        
        let tagConfig = tagViewConfig?.tagsConfig?[indexPath.row]
        
        cell.configure(tagConfig: tagConfig)
        
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let label = UILabel(frame: CGRect.zero)
        label.text = tagViewConfig?.tagsConfig?[indexPath.row].text ?? ""
        label.sizeToFit()
        return CGSize(width: label.frame.size.width + 6 , height: label.frame.size.height + 6)
    }
}
