//
//  LocationsViewModel.swift
//  MapApp
//
//  Created by Samet Çağrı Aktepe on 19.02.2024.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    // All loaded locations
    @Published var locations: [Location]
    
    // Current location on map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    // Current region on map
    @Published var mapRegion: MapCameraPosition = MapCameraPosition.region(MKCoordinateRegion())
    
    // Show list of locations
    @Published var showLocationsList: Bool = false
    
    // Show location detail via sheet
    @Published var sheetLocation: Location? = nil
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MapCameraPosition.region(MKCoordinateRegion(center: location.coordinates, span: mapSpan))
        }
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList.toggle()
        }
    }
    
    func changeMapLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
    
    func nextButtonPressed() {
        // Get the current index
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else {
            print("Current location not found: nextButtonPressed")
            return
        }
        
        // Check if the next index is valid
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            // Next index is not valid, so we go to the first index
            guard let firstLocation = locations.first else {
                print("First location not found: nextButtonPressed")
                return
            }
            changeMapLocation(location: firstLocation)
            return
        }
        
        // Next index is valid
        let nextLocation = locations[nextIndex]
        changeMapLocation(location: nextLocation)
        
    }
}
