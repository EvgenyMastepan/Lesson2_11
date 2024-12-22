//
//  FourTabViewController.swift
//  Lesson2_11
//
//  Created by Evgeny Mastepan on 21.12.2024.
//

import UIKit

class FourTabViewController: UIViewController {

    private lazy var settingsButton: UIButton = {
        $0.frame = CGRect(x: 40, y: view.frame.maxY - 150, width: view.frame.width - 80, height: 40)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .systemMint
        $0.setImage(UIImage(systemName: "gear.circle.fill"), for: .normal)
        $0.setTitle("Settings...", for: .normal)
        $0.tintColor = .white
        return $0
    }(UIButton(primaryAction: UIAction(handler: { _ in
        self.navigationController?.pushViewController(SettingsViewController(), animated: true)
        
    })))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(settingsButton)

    }
    

    

}
