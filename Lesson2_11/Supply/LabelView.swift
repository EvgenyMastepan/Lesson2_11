//
//  LabelView.swift
//  Lesson2_11
//
//  Created by Evgeny Mastepan on 22.12.2024.
//

import UIKit

class LabelView: UILabel {
    init(font: UIFont = .systemFont(ofSize: 16, weight: .regular)) {
        super.init(frame: .zero)
        self.font = font
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = .black
        self.numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
