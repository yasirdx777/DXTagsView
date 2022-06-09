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
    
    private lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var getTagsButton:UIButton = {
        let button = UIButton()
        button.setTitle("show selected tags", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(showTags), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .purple
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
    }()
    
    private lazy var selectedTagsTextView:UITextView = {
        let textView = UITextView()
        textView.textColor = .purple
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .clear
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.isEditable = false
        textView.isSelectable = false
        return textView
    }()
    
    
    private var tagViewConfig:DXTagViewConfig!
    private var tagsViewController: DXTagsView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tagsConfig = [DXTagConfig]()
        
        for i in 1...30 {
            tagsConfig.append(DXTagConfig(id: i, text: "Tag \(i)"))
        }
        
        tagViewConfig = DXTagViewConfig(id: 1, tagsConfig: tagsConfig, tagViewBackgroundColor: .lightGray.withAlphaComponent(0.2))
        
        
        tagsViewController = DXTagsView(tagViewConfig: tagViewConfig)
        
        
        
        
        self.view.addSubview(containerView)
        
        
        
        NSLayoutConstraint.activate([containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
                                     containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
                                     containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
                                     containerView.heightAnchor.constraint(equalToConstant: 250)])
        
        
        
        displayDXTagsView(tagsViewContainer: containerView, contentController: tagsViewController)
        
        
        
        self.view.addSubview(getTagsButton)
        
        NSLayoutConstraint.activate([getTagsButton.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 23),
                                     getTagsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
                                     getTagsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
                                     getTagsButton.heightAnchor.constraint(equalToConstant: 35)])
        
        
        
        
        self.view.addSubview(selectedTagsTextView)
        
        
        NSLayoutConstraint.activate([selectedTagsTextView.topAnchor.constraint(equalTo: getTagsButton.bottomAnchor, constant: 23),
                                     selectedTagsTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
                                     selectedTagsTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
                                     selectedTagsTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
        
        
        
    }
    
    @objc func showTags(_ sender:UIButton?) {
        
        let tagsIndex = tagsViewController.getSelectedIndexPaths()
        
        var tagsLabels = [String]()
        
        for tagIndex in tagsIndex! {
            let tag = tagViewConfig.tagsConfig?[tagIndex.row]
            tagsLabels.append(tag?.text ?? "")
        }
        
        selectedTagsTextView.text = tagsLabels.joined(separator:" - ")
    }
    
}

