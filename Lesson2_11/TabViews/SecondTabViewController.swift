//
//  SecondTabViewController.swift
//  Lesson2_11
//
//  Created by Evgeny Mastepan on 21.12.2024.
//

import UIKit

class SecondTabViewController: UIViewController {
    
    //MARK: - Тут вся возня элементарно ради того, чтобы посмотреть как работает BadgeValue.
    
    private var charNumSwitchStatus: Bool = true
    
    lazy var viewMessage: UIView = {
        $0.backgroundColor = .white
        $0.frame = CGRect(x: 10, y: 80, width: view.frame.maxX - 20, height: view.frame.maxY - 300)
        $0.layer.cornerRadius = 30
        return $0
    }(UIView())
    
    lazy var messageLabel: UILabel = {
        $0.backgroundColor = .white
        $0.frame = CGRect(x: viewMessage.frame.minX + 15, y: viewMessage.frame.minY + 15, width: viewMessage.frame.maxX - 40, height: view.frame.maxY - 330 )
        $0.layer.cornerRadius = 30
        $0.textAlignment = .justified
        $0.textColor = .black
        $0.text = ""
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    private lazy var messagesButton: UIButton = {
        $0.frame = CGRect(x: 10, y: viewMessage.frame.maxY + 10, width: view.frame.maxX - 20, height: 40)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .white
        $0.setImage(UIImage(systemName: "message"), for: .normal)
        $0.setTitle("Get Message", for: .normal)
        $0.tintColor = .systemOrange
        return $0
    }(UIButton(primaryAction: UIAction(handler: { _ in
        self.getMessage()
    })))
    
    lazy var disLabel: UILabel = {
        $0.frame = CGRect(x: numCharSwitch.frame.maxX + 5, y: messagesButton.frame.maxY + 5, width: 300, height: 30)
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 20, weight: .medium)
        $0.textAlignment = .left
        $0.text = "Character / Numeric Messages "
        return $0
    }(UILabel())
    
    lazy var numCharSwitch: UISwitch = {
        $0.frame.origin = CGPoint(x: messagesButton.frame.minX, y: messagesButton.frame.maxY + 5)
//        $0.backgroundColor = .systemOrange
//        $0.onTintColor = .systemOrange
//        $0.thumbTintColor = .white
//        $0.onImage? = UIImage(systemName: "a.circle.fill")!
//        $0.offImage = UIImage(systemName: "1.circle.fill")
        $0.addAction(UIAction { [self] _ in charNumSwitchStatus = !charNumSwitchStatus }, for: .valueChanged)
        return $0
    }(UISwitch())

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        self.view.addSubview(viewMessage)
        self.view.addSubview(messageLabel)
        self.view.addSubview(messagesButton)
        self.view.addSubview(numCharSwitch)
        self.view.addSubview(disLabel)
        
  
        
    }
//MARK: - Вставляем строку в поле.
    private func getMessage() {
        messageLabel.text = messageLabel.text! + randomString(length: Int.random(in: 5...20)) + "\n"
        tabBarItem.badgeValue = String(Int(tabBarItem.badgeValue!)! + 1)
    }
    
// MARK: - Генератор случайных строк.
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let numbers = "0123456789"
        if charNumSwitchStatus {
            return String((0..<length).map{ _ in letters.randomElement()! })
        } else {
            return String((0..<length).map{ _ in numbers.randomElement()! })
        }
    }
}
