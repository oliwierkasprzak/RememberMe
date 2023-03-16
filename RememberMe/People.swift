//
//  People.swift
//  RememberMe
//
//  Created by Oliwier Kasprzak on 15/03/2023.
//

import Foundation
import SwiftUI

class People: Identifiable, ObservableObject {
    var id = UUID()
    var name: String 
    var image: Data?
    
    init(id: UUID = UUID(), name: String, image: Data) {
        self.id = id
        self.name = name
        self.image = image
    }
}

class Results: ObservableObject {
    var results = [People]()
}

