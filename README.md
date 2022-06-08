# DXTagsView

[![Version](https://img.shields.io/cocoapods/v/DXTagsView.svg?style=flat)](https://cocoapods.org/pods/DXTagsView)
[![License](https://img.shields.io/cocoapods/l/DXTagsView.svg?style=flat)](https://cocoapods.org/pods/DXTagsView)
[![Platform](https://img.shields.io/cocoapods/p/DXTagsView.svg?style=flat)](https://cocoapods.org/pods/DXTagsView)

## Features

- Easy to use
- Light weight
- Multi-select and deselect tags
- Customizable tag view


![alt text](https://raw.githubusercontent.com/yasirdx777/DXTagsView/main/Example/DXTagsView/preview.gif)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

DXTagsView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'DXTagsView'
```

## Usage

First import DXTagsView

```swift
import DXTagsView
```

And prepare the DXTagsView data model.

```swift
    private var tagViewConfig:DXTagViewConfig!
    
    var tagsConfig = [DXTagConfig]()
        
    for i in 1...30 {
            tagsConfig.append(DXTagConfig(id: i, text: "Tag \(i)"))
    }
        
    tagViewConfig = DXTagViewConfig(id: 1, tagsConfig: tagsConfig)
```
Then create the DXTagsView VC and initiate it with the data model you prepared.

```swift
    private var tagsViewController: DXTagsView!
    
    tagsViewController = DXTagsView(tagViewConfig: tagViewConfig)
```
In the end just add tagsViewController as child VC warped in a container view.

```swift
    private lazy var containerView = UIView()
    
    containerView.translatesAutoresizingMaskIntoConstraints = false
        
    NSLayoutConstraint.activate([containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
                                     containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
                                     containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 12),
                                     containerView.heightAnchor.constraint(equalToConstant: 300)])
        
        
        
    displayDXTagsView(tagsViewContainer: containerView, contentController: tagsViewController)
```

And to get the selected tags index

```swift
    let tagsIndex = tagsViewController.getSelectedIndexPaths()
```

## Author

Yasir Romaya, yasir.romaya@gmail.com

## License

DXTagsView is available under the MIT license. See the LICENSE file for more info.
