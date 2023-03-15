//
//  ContentView.swift
//  RememberMe
//
//  Created by Oliwier Kasprzak on 15/03/2023.
//

import SwiftUI

struct ContentView: View {
     private var people = [People]()
    @State private var image: Image?
    @State private var inputImage: UIImage?
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(people) { picture in
                        NavigationLink {
                            DetailView()
                        } label: {
                            VStack {
                                image?
                                    .scaledToFit()
                                
                                Spacer()
                                
                                Rectangle()
                                    .fill(.gray)
                                    .frame(height: 2)
                                    .opacity(0.5)
                                    .padding([.trailing, .leading])
                                
                                Text("1")
                                    .padding(.bottom, 5)
                            }
                            .padding(.top)
                            .frame(width: 130, height: 130)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.blue)
                            }
                        }
                    }
                }
            }
            .navigationTitle("RememberMe")
            .toolbar {
                Button {
                    ImagePicker(image: $inputImage)
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
