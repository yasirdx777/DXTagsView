//
//  DXTagsConfigModel.swift
//  DXTagsView
//
//  Created by Yasir Romaya on 6/8/22.
//

import Foundation
import UIKit

public struct DXTagViewConfig {
    public let id:Int
    
    public let tagsConfig:[DXTagConfig]?
    
    public init(id:Int, tagsConfig:[DXTagConfig]?) {
        self.id = id
        self.tagsConfig = tagsConfig
    }
    
}


public struct DXTagConfig {
    public let id:Int
    
    public let text:String
    
    public let selectedTextAlignment:NSTextAlignment
    public let unselectedTextAlignment:NSTextAlignment
    
    public let selectedTextColor:UIColor
    public let unselectedTextColor:UIColor
    
    public let selectedBackgroundColor:UIColor
    public let unselectedBackgroundColor:UIColor
    
    public let selectedBorderWidth:CGFloat
    public let unselectedBorderWidth:CGFloat
    
    public let selectedCornerRadius:CGFloat
    public let unselectedCornerRadius:CGFloat
    
    public let selectedBorderColor:UIColor
    public let unselectedBorderColor:UIColor
    
    
    public init(id:Int,
                text:String,
                selectedTextAlignment:NSTextAlignment = .center,
                unselectedTextAlignment:NSTextAlignment = .center,
                selectedTextColor:UIColor = .white,
                unselectedTextColor:UIColor = .purple,
                selectedBackgroundColor:UIColor = .purple,
                unselectedBackgroundColor:UIColor = .clear,
                selectedBorderWidth:CGFloat = 1,
                unselectedBorderWidth:CGFloat = 1,
                selectedCornerRadius:CGFloat = 4,
                unselectedCornerRadius:CGFloat = 4,
                selectedBorderColor:UIColor = .purple,
                unselectedBorderColor:UIColor = .purple) {
        
        self.id = id
        self.text = text
        self.selectedTextAlignment = selectedTextAlignment
        self.unselectedTextAlignment = unselectedTextAlignment
        self.selectedTextColor = selectedTextColor
        self.unselectedTextColor = unselectedTextColor
        self.selectedBackgroundColor = selectedBackgroundColor
        self.unselectedBackgroundColor = unselectedBackgroundColor
        self.selectedBorderWidth = selectedBorderWidth
        self.unselectedBorderWidth = unselectedBorderWidth
        self.selectedCornerRadius = selectedCornerRadius
        self.unselectedCornerRadius = unselectedCornerRadius
        self.selectedBorderColor = selectedBorderColor
        self.unselectedBorderColor = unselectedBorderColor
    }
    
}
