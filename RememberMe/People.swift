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
    
    var coordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

class Results: Codable, ObservableObject {
    var results = [People]()
    
    init() {
        
        let url = getDocumentsDirectory().appendingPathComponent("people.json")
        do {
            let data = try? Data(contentsOf: url)
            let decoded = try JSONDecoder().decode([People].self, from: data ?? Data([]))
            results = decoded
            print("smiga")
            return
        } catch {
            print("nie smiga elegancko")
            print(error.localizedDescription)
            print(url)
            results = []
        }
    }
    
    func save(people: [People]) {
        let url = getDocumentsDirectory().appendingPathComponent("people.json")
        do {
            let data = try? JSONEncoder().encode(people)
            try data?.write(to: url, options: [.atomic, .completeFileProtection])
            
        } catch {
            
            print(error.localizedDescription)
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

