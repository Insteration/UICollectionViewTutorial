//
//  CollectionViewController.swift
//  UICollectionViewTutorial
//
//  Created by Артём Кармазь on 5/25/19.
//  Copyright © 2019 Artem Karmaz. All rights reserved.
//

import UIKit

private struct Fruit {
    let name: String
    let icon: UIImage
}

private let reuseIdentifier = "Cell"
private var longPressGesture: UILongPressGestureRecognizer!
private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)

class CollectionViewController: UICollectionViewController {
    
    private var fruits = [Fruit(name: "Apple", icon: UIImage(named: "apple")!),
                  Fruit(name: "Banana", icon: UIImage(named: "banana")!),
                  Fruit(name: "Garnet", icon: UIImage(named: "garnet")!),
                  Fruit(name: "Grapes", icon: UIImage(named: "grapes")!),
                  Fruit(name: "Green Apple", icon: UIImage(named: "green_apple")!),
                  Fruit(name: "Green Pears", icon: UIImage(named: "green_pears")!),
                  Fruit(name: "Kiwi", icon: UIImage(named: "kiwi")!),
                  Fruit(name: "Mango", icon: UIImage(named: "mango")!),
                  Fruit(name: "Mango 2", icon: UIImage(named: "mango2")!),
                  Fruit(name: "Orange", icon: UIImage(named: "orange")!),
                  Fruit(name: "Pears", icon: UIImage(named: "pears")!),
                  Fruit(name: "Pineapple", icon: UIImage(named: "pineapple")!)
    ]
    
    private let itemsPerRow: CGFloat = 3

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    
        longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongGesture(gesture:)))
        collectionView.addGestureRecognizer(longPressGesture)
    }
    
    @objc func handleLongGesture(gesture: UILongPressGestureRecognizer) {
        switch(gesture.state) {
            
        case .began:
            guard let selectedIndexPath = collectionView.indexPathForItem(at: gesture.location(in: collectionView)) else { break }
            collectionView.beginInteractiveMovementForItem(at: selectedIndexPath)
        case .changed:
            collectionView.updateInteractiveMovementTargetPosition(gesture.location(in: gesture.view!))
        case .ended:
            collectionView.endInteractiveMovement()
        default:
            collectionView.cancelInteractiveMovement()
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fruits.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        let image = fruits[indexPath.row].icon
        let imageView = UIImageView(frame: cell.contentView.frame)
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        cell.contentView.addSubview(imageView)
    
        return cell
    }
    
    // MARK: UICollectionView move cells
    
    override func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let temp = fruits.remove(at: sourceIndexPath.item)
        fruits.insert(temp, at: destinationIndexPath.item)
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
    // MARK: UICollectionView Frames
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - padding
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
