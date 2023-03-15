//
//  People.swift
//  RememberMe
//
//  Created by Oliwier Kasprzak on 15/03/2023.
//

import Foundation
import SwiftUI

struct People: Identifiable {
    var id = UUID()
    var name: String 
    var image: Image?
}

