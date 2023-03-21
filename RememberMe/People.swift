//
//  People.swift
//  RememberMe
//
//  Created by Oliwier Kasprzak on 15/03/2023.
//

import Foundation
import SwiftUI

class People: Codable, Identifiable, ObservableObject {
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
    
    static func loadFromFile() -> [People] {
        let url = ContentView.getDocumentDirectory().appendingPathComponent("people.txt")
        
        guard let data = try? Data(contentsOf: url) else {
                  return []
              }
              let decoder = JSONDecoder()
              guard let decoded = try? decoder.decode([People].self, from: data) else {
                  return []
              }
              return decoded
          }
    
}

