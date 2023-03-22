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
    @State var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    var body: some View {
        Map(coordinateRegion: $mapRegion)
            .ignoresSafeArea()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(image: Image("Example"), name: "John")
    }
}
