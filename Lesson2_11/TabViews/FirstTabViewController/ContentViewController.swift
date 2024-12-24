//
//  ContentViewController.swift
//  Lesson2_11
//
//  Created by Evgeny Mastepan on 22.12.2024.
//

import UIKit

class ContentViewController: UIViewController, UIScrollViewDelegate {
    private var imageOriginPlace: CGPoint = .zero
    private var imageScale: CGAffineTransform = .init(scaleX: 1, y: 1)
    private let ourIndent: CGFloat = 15
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
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapRecognize))
        tapGesture.numberOfTapsRequired = 1
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        // Не срабатывает UITapGesture. Why?
        $0.isUserInteractionEnabled = false
        $0.addGestureRecognizer(tapGesture)
        self.imageOriginPlace = $0.frame.origin
        return $0
    }(UIImageView())
    
    lazy var magnificationLabel = LabelView(font: .systemFont(ofSize: 18, weight: .bold), color: .white)
    
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
//        centerImage()
    }
    
    func setContent() {
        let content = data[numPage]
        topImage.image = UIImage(named: content.userImage)
        
    }
// MARK: - Попытка поставить картинку по центру Scroll, прокрутив его.
//    func centerImage() {
//        let centerOffsetX = (scrollView.contentSize.width - scrollView.frame.size.width / 2)
//        let centerOffsetY = (scrollView.contentSize.height - scrollView.frame.size.height / 2)
//        let centerPoint = CGPoint(x: centerOffsetX, y: centerOffsetY)
//        scrollView.setContentOffset(centerPoint, animated: true)
//    }
    
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
            topImage.leadingAnchor.constraint(equalTo: scrollViewContent.leadingAnchor),
            topImage.trailingAnchor.constraint(equalTo: scrollViewContent.trailingAnchor),
            topImage.heightAnchor.constraint(equalToConstant: 250),
            
            magnificationLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            magnificationLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            magnificationLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            magnificationLabel.heightAnchor.constraint(equalToConstant: 25),
        ])
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.topImage
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        magnificationLabel.text = "Magn.: " + String(format: "%.2f", Double(scale))
    }
    
    @objc func tapRecognize(sender: UITapGestureRecognizer) {
        print("tap")
        guard let senderView = sender.view else { return }
        UIView.animate(withDuration: 0.4) { [weak self] in
            guard let self = self else { return }
            senderView.transform = self.imageScale
            senderView.frame.origin = self.imageOriginPlace
        }
    }
}
