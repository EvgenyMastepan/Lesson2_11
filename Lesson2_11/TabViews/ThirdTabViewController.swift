//
//  ThirdTabViewController.swift
//  Lesson2_11
//
//  Created by Evgeny Mastepan on 21.12.2024.
//

import UIKit

class ThirdTabViewController: UIViewController {
    
    lazy var biglabel: UILabel = {
        $0.frame = CGRect(x: 10, y: 150, width: view.frame.width - 20, height: 300)
        $0.textColor = .systemCyan
        $0.font = .systemFont(ofSize: 150, weight: .thin)
        $0.textAlignment = .center
        $0.text = "0"
        return $0
    }(UILabel())
    
    lazy var planeImage: UIImageView = {
        $0.image = UIImage(named: "5")
        $0.frame = CGRect(x: 20, y: view.frame.maxY, width: 60, height: 60)
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())

    lazy var slider: UISlider = {
        $0.frame = CGRect(x: 10, y: view.frame.maxY - 150, width: view.frame.width - 20, height: 30)
        $0.backgroundColor = .white
        $0.minimumValue = 0
        $0.maximumValue = 10
        $0.maximumTrackTintColor = .systemRed
        $0.minimumTrackTintColor = .systemGreen
        $0.addAction(sliderAction, for: .valueChanged)
        return $0
    }(UISlider())
    
    lazy var sliderAction: UIAction = UIAction { action in
        guard let sender = action.sender as? UISlider else { return }
        sender.value = Float(Int(self.slider.value))
        self.biglabel.text = String(sender.value)
        let heightOfView = self.view.frame.height / 10
        UIView.animate(withDuration: 0.5) { [weak self] in
            guard let self = self else { return }
            self.planeImage.frame.origin.y = self.view.frame.height - CGFloat(sender.value) * heightOfView - 60
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(slider)
        self.view.addSubview(biglabel)
        self.view.addSubview(planeImage)
    }
}
