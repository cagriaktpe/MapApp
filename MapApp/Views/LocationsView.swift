//
//  LocationsView.swift
//  MapApp
//
//  Created by Samet Çağrı Aktepe on 19.02.2024.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    @EnvironmentObject var vm: LocationsViewModel
    
    var body: some View {
        ZStack {
            Map(position: $vm.mapRegion)
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
