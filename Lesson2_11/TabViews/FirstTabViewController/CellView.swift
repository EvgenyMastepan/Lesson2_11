//
//  CellView.swift
//  Lesson2_11
//
//  Created by Evgeny Mastepan on 22.12.2024.
//

import UIKit

class CellView: UICollectionViewCell {
    static let identifier: String = "CellView"
    let ourIndent:CGFloat = 15
    private var imageOriginPlace: CGPoint = .zero
    private var imageScale: CGAffineTransform = .init(scaleX: 1, y: 1)
    
    lazy var screenWidth = UIScreen.main.bounds.width - 4 * ourIndent
    lazy var userImage: UIImageView = {
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapRecognize(sender: )))
//        tapGesture.numberOfTapsRequired = 2
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panRecognize))
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchRecognize))
        $0.isUserInteractionEnabled = true
//        $0.addGestureRecognizer(tapGesture)
        $0.addGestureRecognizer(panGesture)
        $0.addGestureRecognizer(pinchGesture)
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
        $0.translatesAutoresizingMaskIntoConstraints = false
        self.imageOriginPlace = $0.frame.origin
        return $0
    }(UIImageView())
        
        
        
    lazy var userNameLabel = LabelView(font: .systemFont(ofSize: 20, weight: .bold))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        contentView.backgroundColor = .white
        contentView.addSubviews(userImage, userNameLabel)
        
    }
    
//    @objc func tapRecognize(sender: UITapGestureRecognizer) {
//        print("tap")
//    }
    
    @objc func panRecognize(sender: UIPanGestureRecognizer) {
        guard let senderView = sender.view else { return }
        let translation = sender.translation(in: contentView)
        senderView.frame.origin = CGPoint(x: senderView.frame.origin.x + translation.x,
                                          y: senderView.frame.origin.y + translation.y)
        if sender.state == .ended {
            UIView.animate(withDuration: 0.4) { [weak self] in
                guard let self = self else { return }
                senderView.frame.origin = self.imageOriginPlace
            }
            
        }
        sender.setTranslation(.zero, in: contentView)
    }
    
    @objc func pinchRecognize(sender: UIPinchGestureRecognizer) {
        guard let senderView = sender.view else { return }
        senderView.transform = senderView.transform.scaledBy(x: sender.scale, y: sender.scale)
        if sender.state == .ended {
            UIView.animate(withDuration: 0.2) { [weak self] in
                guard let self = self else { return }
                senderView.transform = self.imageScale
            }
        }
        sender.scale = 1
    }
    
    private func setConstraints() {
        let imageRatio = userImage.image?.getRatio() ?? 0
        let imageHeight =  imageRatio * screenWidth
        
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: ourIndent),
            userImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ourIndent),
            userImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -ourIndent),
            userImage.widthAnchor.constraint(equalToConstant: screenWidth),
            userImage.heightAnchor.constraint(equalToConstant: imageHeight),
            
            userNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ourIndent),
            userNameLabel.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 5),
            userNameLabel.heightAnchor.constraint(equalToConstant: 40),
            userNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -ourIndent),
            userNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -ourIndent)
        ])
    }
    
    func setupCell(data: Card) {
        userImage.image = UIImage(named: data.userImage)
        userNameLabel.text = data.userName
        setConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
