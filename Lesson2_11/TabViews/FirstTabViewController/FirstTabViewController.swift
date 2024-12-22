//
//  FirstTabViewController.swift
//  Lesson2_11
//
//  Created by Evgeny Mastepan on 21.12.2024.
//

import UIKit

class FirstTabViewController: UIViewController {
    let ourIndent: CGFloat = 15
    let data = Card.cards
    
    lazy var collectionView: UICollectionView = {
        let layout = $0.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = ourIndent
        layout.minimumInteritemSpacing = ourIndent
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        $0.contentInset = UIEdgeInsets(top: ourIndent, left: ourIndent, bottom: ourIndent, right: ourIndent)
        $0.delegate = self
        $0.dataSource = self
        $0.register(CellView.self, forCellWithReuseIdentifier: CellView.identifier)

        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: UICollectionViewFlowLayout()))

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(collectionView)
        


    }
    

}
