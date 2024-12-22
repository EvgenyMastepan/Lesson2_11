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
    
    lazy var screenWidth = UIScreen.main.bounds.width - 4 * ourIndent
    lazy var userImage = ImageView(round: 20)
    lazy var userNameLabel = LabelView(font: .systemFont(ofSize: 20, weight: .bold))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemMint
        contentView.addSubviews(userImage, userNameLabel)
        
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
