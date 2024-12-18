//
//  WeatherSearchViewModel.swift
//  NooroTakeHome
//
//  Created by Dmitry Matveichev on 12/13/24.
//

import Foundation

@MainActor
class WeatherSearchViewModel: ObservableObject {
    @Published var weather: WeatherResponse?
    @Published var isLoading: Bool = false
    @Published var searchTerm: String = "" {
        didSet {
            if searchTerm != oldValue {
                fetchWeather()
            }
        }
    }
    
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchWeather() {
        guard !searchTerm.isEmpty else {
            weather = nil
            return
        }
        
        isLoading = true
        
        Task {
            do {
                self.weather = try await networkService.getWeatherInfo(searchTerm: searchTerm)
            } catch {
                print("Error fetching weather: \(error)")
                self.weather = nil
            }
            isLoading = false
        }
    }
}
