//
//  ContentView.swift
//  RememberMe
//
//  Created by Oliwier Kasprzak on 15/03/2023.
//

import SwiftUI

struct ContentView: View {
    @Binding var people: Results
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var showingPicker = false
    @State private var name = ""
    @State private var inputName = ""
    @State private var showingAlert = false
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(people.results.reversed()) { picture in
                        NavigationLink {
                            DetailView(image: Image(uiImage: UIImage(data: picture.image!)!), name: picture.name)
                        } label: {
                            VStack {
                                Image(uiImage: UIImage(data: picture.image!)!)
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
            .alert("Provide name", isPresented: $showingAlert) {
                TextField("Provide name", text: $inputName)
                Button("OK") {
                    
                }
            }
        }
    }
    
     func loadImage() {
        guard let inputImage = inputImage else { return }
         guard let data = inputImage.jpegData(compressionQuality: 0.8) else { print("Wrong data")
             return
            }
         
             showingAlert = true
             image = Image(uiImage: inputImage)
             name = inputName
             let user = People(name: name, image: data)
             people.results.append(user)
         
        
     
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(people: .constant(Results()))
    }
}
