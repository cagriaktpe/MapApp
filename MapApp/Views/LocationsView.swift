//
//  LocationsView.swift
//  MapApp
//
//  Created by Samet Çağrı Aktepe on 19.02.2024.
//

import SwiftUI

struct LocationsView: View {
    @EnvironmentObject var vm: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(vm.locations) {
                Text($0.name)
            }
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
