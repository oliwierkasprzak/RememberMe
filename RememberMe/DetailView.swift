//
//  DetailView.swift
//  RememberMe
//
//  Created by Oliwier Kasprzak on 15/03/2023.
//

import SwiftUI

struct DetailView: View {
    var image: Image
    var name: String
    var body: some View {
        VStack {
            
            Text(name)
                .font(.title2)
                .fontDesign(.rounded)
                .padding(.top, 30)
            image
                .resizable()
                .scaledToFit()
                .padding()
            
            Spacer()
                
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(image: Image("Example"), name: "John")
    }
}
