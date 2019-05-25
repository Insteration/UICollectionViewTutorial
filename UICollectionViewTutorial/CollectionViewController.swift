//
//  CollectionViewController.swift
//  UICollectionViewTutorial
//
//  Created by Артём Кармазь on 5/25/19.
//  Copyright © 2019 Artem Karmaz. All rights reserved.
//

import UIKit

struct Fruit {
    let name: String
    let icon: UIImage
}

private let reuseIdentifier = "Cell"
private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)

class CollectionViewController: UICollectionViewController {
    
//    let fruits = [1, 2, 3, 4, 5, 6, 7, 8]
    
    let fruits = [Fruit(name: "Apple", icon: UIImage(named: "apple")!),
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
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

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


    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
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
