//
//  ContentViewController.swift
//  Lesson2_11
//
//  Created by Evgeny Mastepan on 22.12.2024.
//

import UIKit

class ContentViewController: UIViewController, UIScrollViewDelegate {
    
    let ourIndent: CGFloat = 15
    let data = Card.cards
    
    var numPage: Int
    
    lazy var scrollView: UIScrollView = {
        $0.contentInsetAdjustmentBehavior = .never
        $0.backgroundColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.minimumZoomScale = 1
        $0.maximumZoomScale = 5
        $0.alwaysBounceVertical = false
        $0.alwaysBounceHorizontal = false
        $0.delegate = self
        $0.addSubview(scrollViewContent)
        return $0
    }(UIScrollView())

    lazy var topImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())
    
    lazy var magnificationLabel = LabelView(font: .systemFont(ofSize: 18, weight: .bold))
    
    lazy var scrollViewContent: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .black
        $0.addSubviews(topImage)
        return $0
    }(UIView())
    
    init(numPage: Int){
        self.numPage = numPage
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setContent()
        view.addSubview(scrollView)
        view.addSubview(magnificationLabel)
        magnificationLabel.text = "Magn.: 1"
        setupConstraint()
    }
    
    func setContent() {
        let content = data[numPage]
        topImage.image = UIImage(named: content.userImage)
        
    }

    func setupConstraint() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),

            scrollViewContent.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollViewContent.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollViewContent.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollViewContent.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollViewContent.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            topImage.topAnchor.constraint(equalTo: scrollViewContent.topAnchor),
//            topImage.centerYAnchor.constraint(equalTo: scrollViewContent.centerYAnchor),
            topImage.leadingAnchor.constraint(equalTo: scrollViewContent.leadingAnchor),
            topImage.trailingAnchor.constraint(equalTo: scrollViewContent.trailingAnchor),
            topImage.heightAnchor.constraint(equalToConstant: 250),
            
            magnificationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            magnificationLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            magnificationLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            magnificationLabel.heightAnchor.constraint(equalToConstant: 25),
        ])
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.topImage
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        magnificationLabel.text = "Magn.: " + String(Int(scale))
    }
}
