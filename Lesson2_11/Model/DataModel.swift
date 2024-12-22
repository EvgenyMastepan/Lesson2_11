//
//  DataModel.swift
//  Lesson2_11
//
//  Created by Evgeny Mastepan on 22.12.2024.
//

import UIKit

struct Card: Identifiable {
    var id: String = UUID().uuidString
    
    var userImage: String
    var userName: String
    
    static var cards: [Card] {[
        Card(userImage: "1", userName: "Ulysse Nardin"),
        Card(userImage: "2", userName: "Rado"),
        Card(userImage: "3", userName: "IWC"),
        Card(userImage: "4", userName: "Franck Muller")
    ]}
}
