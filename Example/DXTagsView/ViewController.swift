//
//  ViewController.swift
//  DXTagsView
//
//  Created by Yasir Romaya on 06/08/2022.
//  Copyright (c) 2022 Yasir Romaya. All rights reserved.
//

import UIKit
import DXTagsView

class ViewController: UIViewController {
    
    private lazy var containerView = UIView()
    
    private lazy var getTagsButton:UIButton = {
        let button = UIButton()
        button.setTitle("show selected Tags", for: .normal)
        button.setTitleColor(UIColor.purple, for: .normal)
        button.addTarget(self, action: #selector(showTags), for: .touchUpInside)
        return button
    }()
    
    private lazy var selectedTagsLabel:UILabel = {
        let label = UILabel()
        label.textColor = .purple
        label.numberOfLines = 100
        return label
    }()
    
    
    private var tagViewConfig:DXTagViewConfig!
    private var tagsViewController: DXTagsView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tagsConfig = [DXTagConfig]()
        
        for i in 1...30 {
            tagsConfig.append(DXTagConfig(id: i, text: "Tag \(i)"))
        }
        
        tagViewConfig = DXTagViewConfig(id: 1, tagsConfig: tagsConfig)
        
        
        tagsViewController = DXTagsView(tagViewConfig: tagViewConfig)
        
        
        
        
        self.view.addSubview(containerView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
                                     containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
                                     containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 12),
                                     containerView.heightAnchor.constraint(equalToConstant: 300)])
        
        
        
        displayDXTagsView(tagsViewContainer: containerView, contentController: tagsViewController)
        
        
        
        self.view.addSubview(getTagsButton)
        
        getTagsButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([getTagsButton.topAnchor.constraint(equalTo: containerView.bottomAnchor),
                                     getTagsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
                                     getTagsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 12),
                                     getTagsButton.heightAnchor.constraint(equalToConstant: 100)])
        
        
        
        
        self.view.addSubview(selectedTagsLabel)
        
        selectedTagsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([selectedTagsLabel.topAnchor.constraint(equalTo: getTagsButton.topAnchor),
                                     selectedTagsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
                                     selectedTagsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 12),
                                     selectedTagsLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
        
        
        
    }
    
    @objc func showTags(_ sender:UIButton?) {
        
        let tagsIndex = tagsViewController.getSelectedIndexPaths()
        
        var tagsLabels = [String]()
        
        for tagIndex in tagsIndex! {
            let tag = tagViewConfig.tagsConfig?[tagIndex.row]
            tagsLabels.append(tag?.text ?? "")
        }
        
        selectedTagsLabel.text = tagsLabels.joined(separator:" - ")
    }
    
}

