//
//  MapAppApp.swift
//  MapApp
//
//  Created by Samet Çağrı Aktepe on 19.02.2024.
//

import SwiftUI

@main
struct MapAppApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
