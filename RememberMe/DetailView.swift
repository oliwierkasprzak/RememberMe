//
//  DetailView.swift
//  RememberMe
//
//  Created by Oliwier Kasprzak on 15/03/2023.
//

import SwiftUI
import MapKit

struct DetailView: View {
    var image: Image
    var name: String
    static let locationFetcher = LocationFetcher()
    var people: People
    
    @State var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    var body: some View {
        let locations = [Location(coordinates: people.coordinates)]
        Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.coordinates.latitude, longitude: location.coordinates.longitude)) {
                VStack {
                    
                    Image(systemName: "heart.fill")
                        .resizable()
                        .foregroundColor(.red)
                        .background(.black)
                        .clipShape(Circle())
                }
                    
                    Text(people.name)
                        .fixedSize()
                
            }
        }
        .ignoresSafeArea()
    }
}
