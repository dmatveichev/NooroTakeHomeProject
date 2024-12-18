//
//  WeatherSearchView.swift
//  NooroTakeHome
//
//  Created by Dmitry Matveichev on 12/13/24.
//


import SwiftUI

struct WeatherSearchView: View {
    @StateObject private var viewModel: WeatherSearchViewModel
    
    @State private var selectedCity: WeatherResponse?
    
    init(networkService: NetworkServiceProtocol) {
        _viewModel = StateObject(wrappedValue: WeatherSearchViewModel(networkService: networkService))
    }
    
    var body: some View {
        VStack {
            SearchBar(text: $viewModel.searchTerm)
            
            if viewModel.isLoading {
                VStack {
                    ProgressView()
                        .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let weather = selectedCity, viewModel.searchTerm.isEmpty {
                WeatherDetailsView(weather: weather)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            } else if let weather = viewModel.weather {
                SearchResultView(weather: weather)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .onTapGesture {
                        viewModel.searchTerm = ""
                        selectedCity = weather
                    }
            } else if viewModel.searchTerm.isEmpty {
                VStack {
                    Text("No City Selected")
                        .foregroundColor(.weatherText)
                        .font(.poppinsMedium(size: 30))
                    Text("Please Search For A City")
                        .foregroundColor(.weatherText)
                        .font(.poppinsMedium(size: 15))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                Text("") // No Results
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .onSubmit { 
            viewModel.fetchWeather()
        }
        .padding()
    }
}
