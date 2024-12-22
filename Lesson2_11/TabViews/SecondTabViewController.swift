//
//  SecondTabViewController.swift
//  Lesson2_11
//
//  Created by Evgeny Mastepan on 21.12.2024.
//

import UIKit

class SecondTabViewController: UIViewController {
    
    //MARK: - Тут вся возня ради того, чтобы посмотреть как работает BadgeValue.
    
    lazy var viewMessage: UIView = {
        $0.backgroundColor = .white
        $0.frame = CGRect(x: 10, y: 70, width: view.frame.maxX - 20, height: view.frame.maxY - 300)
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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        self.view.addSubview(viewMessage)
        self.view.addSubview(messageLabel)
        self.view.addSubview(messagesButton)
        
  
        
    }
//MARK: - Вставляем строку в поле.
    private func getMessage() {
        messageLabel.text = messageLabel.text! + randomString(length: Int.random(in: 5...20)) + "\n"
        tabBarItem.badgeValue = String(Int(tabBarItem.badgeValue!)! + 1)
    }
    
// MARK: - Генератор случайных строк.
    func randomString(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
}
