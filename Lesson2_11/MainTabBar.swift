//
//  ViewController.swift
//  Lesson2_11
//
//  Created by Evgeny Mastepan on 21.12.2024.
//

import UIKit

class TabBarView: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        setTab()
    }

    // MARK: - Активация настроек ТабБар
    private func setTab() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = UIColor(named: "appCyan")
        tabBar.unselectedItemTintColor = .systemGray2

        let firstVC = settingTab(controllerName: FirstTabViewController(), imageName: "house", selImageName: "house.fill", titleString: "Sweet home")
        let secondVC = settingTab(controllerName: SecondTabViewController(), imageName: "character.bubble", selImageName: "character.bubble.fill", titleString: "Message")
        secondVC.tabBarItem.badgeValue = "9"
        secondVC.tabBarItem.badgeColor = .systemOrange
        let thirdVC = settingTab(controllerName: ThirdTabViewController(), imageName: "gamecontroller", selImageName: "gamecontroller.fill", titleString: "Game")
        let fourVC = settingTab(controllerName: FourTabViewController(), imageName: "exclamationmark.triangle", selImageName: "exclamationmark.triangle.fill", titleString: "Warning!")
        
        setViewControllers([firstVC, secondVC, thirdVC, fourVC], animated: true)
    }
    
    // MARK: - Настройка закладок ТабБар
    private func settingTab(controllerName: UIViewController, imageName: String, selImageName: String, titleString: String) -> UIViewController {
        let vc = controllerName
        vc.tabBarItem.image = UIImage(systemName: imageName)
        vc.tabBarItem.selectedImage = UIImage(systemName: selImageName)
        vc.tabBarItem.title = titleString
        
        return vc
    }
    
}


