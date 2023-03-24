//
//  People.swift
//  RememberMe
//
//  Created by Oliwier Kasprzak on 15/03/2023.
//

import CoreLocation
import Foundation
import SwiftUI

struct Location: Identifiable {
    let id = UUID()
    let coordinates: CLLocationCoordinate2D
}

struct People: Codable, Identifiable {
    var id = UUID()
    var name: String 
    var image: Data?
    var longitude: Double
    var latitude: Double
    
//    init(id: UUID = UUID(), name: String, image: Data, longitude: Double, latitude: Double) {
//        self.id = id
//        self.name = name
//        self.image = image
//        self.longitude = longitude
//        self.latitude = latitude
//    }
    
    var coordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
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

