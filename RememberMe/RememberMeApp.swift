//
//  RememberMeApp.swift
//  RememberMe
//
//  Created by Oliwier Kasprzak on 15/03/2023.
//

import SwiftUI

@main
struct RememberMeApp: App {
    let results = Results()
    var body: some Scene {
        WindowGroup {
            ContentView(people: .constant(results))
        }
    }
}
