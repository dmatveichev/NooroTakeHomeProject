//
//  ContentView.swift
//  NooroTakeHome
//
//  Created by Dmitry Matveichev on 12/13/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        WeatherSearchView(networkService: NetworkService(session: URLSession.shared))
    }
}

#Preview {
    ContentView()
}
