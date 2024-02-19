//
//  LocationsViewModel.swift
//  MapApp
//
//  Created by Samet Çağrı Aktepe on 19.02.2024.
//

import Foundation

class LocationsViewModel: ObservableObject {
    @Published var locations: [Location]
    
    init() {
        self.locations = LocationsDataService.locations
    }
}
