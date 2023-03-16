//
//  ContentView.swift
//  RememberMe
//
//  Created by Oliwier Kasprzak on 15/03/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var people = Results()
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var showingPicker = false
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(people.results) { picture in
                        NavigationLink {
                            DetailView(image: image ?? Image("Example") , name: "John")
                        } label: {
                            VStack {
                                image?
                                    .resizable()
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
                    showingPicker = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingPicker) {
                ImagePicker(image: $inputImage)
            }
            .onChange(of: inputImage) { _ in loadImage() }
        }
    }
    
     func loadImage() {
        guard let inputImage = inputImage else { return }
         guard let data = inputImage.jpegData(compressionQuality: 0.8) else { print("Wrong data")
             return
            }
        image = Image(uiImage: inputImage)
         
         let user = People(name: "John", image: data)
         people.results.append(user)
        
     
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
