//
//  ExtensionForCollection.swift
//  Lesson2_11
//
//  Created by Evgeny Mastepan on 22.12.2024.
//

import UIKit

extension FirstTabViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellView.identifier, for: indexPath) as! CellView
        
        let card = data[indexPath.item]
        cell.setupCell(data: card)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ContentViewController(numPage: indexPath.item)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}

extension UIImage {
    func getRatio() -> CGFloat? {
        return self.size.height / self.size.width
    }
}
