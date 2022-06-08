//
//  DXTagView.swift
//  DXTagsView
//
//  Created by Yasir Romaya on 6/8/22.
//

import Foundation
import UIKit

class DXTagView: UICollectionViewCell {
    
    private var tagConfig:DXTagConfig?
    private lazy var tagView = UILabel(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func createView(){
        
        self.contentView.addSubview(tagView)
        
        tagView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate( [
            topAnchor.constraint(equalTo: tagView.topAnchor),
            leadingAnchor.constraint(equalTo: tagView.leadingAnchor),
            tagView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tagView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
    }
    
    func configure(tagConfig: DXTagConfig?) {
        self.tagConfig = tagConfig
        
        tagView.text = tagConfig?.text ?? ""
        tagView.layer.masksToBounds = true
        
        setUnselectedTag()
    }
    
    
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                setSelectedTag()
            }
            else {
                setUnselectedTag()
            }
        }
    }
    
    
    func setSelectedTag(){
        guard let tagConfig = tagConfig else {return}
        
        tagView.textAlignment = tagConfig.selectedTextAlignment
        tagView.textColor = tagConfig.selectedTextColor
        
        tagView.backgroundColor = tagConfig.selectedBackgroundColor
        
        tagView.layer.borderColor = tagConfig.selectedBorderColor.cgColor
        tagView.layer.cornerRadius = tagConfig.selectedCornerRadius
        tagView.layer.borderWidth = tagConfig.selectedBorderWidth
    }
    
    func setUnselectedTag(){
        guard let tagConfig = tagConfig else {return}
        
        tagView.textAlignment = tagConfig.unselectedTextAlignment
        tagView.textColor = tagConfig.unselectedTextColor
        
        tagView.backgroundColor = tagConfig.unselectedBackgroundColor
        
        tagView.layer.borderColor = tagConfig.unselectedBorderColor.cgColor
        tagView.layer.cornerRadius = tagConfig.unselectedCornerRadius
        tagView.layer.borderWidth = tagConfig.unselectedBorderWidth
    }
    
}
