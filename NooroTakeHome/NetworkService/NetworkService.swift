//
//  NetworkService.swift
//  NooroTakeHome
//
//  Created by Dmitry Matveichev on 12/13/24.
//

import Foundation

extension URLSession: URLSessionProtocol {}

class NetworkService: NetworkServiceProtocol {
    private let session: URLSessionProtocol
    
    private let weatherAPIKey = "c10c17e1f7cb415d94a143837241312"
    private let baseURL = "https://api.weatherapi.com/v1/current.json"
    
    init(session: URLSessionProtocol) {
        self.session = session
    }
    
    func getWeatherInfo(searchTerm: String) async throws -> WeatherResponse {
        guard let encodedTerm = searchTerm.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            throw NetworkServiceError.invalidSearchTerm
        }
        let urlString = "\(baseURL)?key=\(weatherAPIKey)&q=\(encodedTerm)"
        
        guard let url = URL(string: urlString) else {
            throw NetworkServiceError.invalidURL
        }
        
        let (data, response) = try await session.data(from: url)
        
        guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
            throw NetworkServiceError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let response = try decoder.decode(WeatherResponse.self, from: data)
            return response
        } catch {
            print("Decoding Error: \(error)")
            throw NetworkServiceError.invalidData
        }
    }
}

enum NetworkServiceError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case invalidData
    case invalidSearchTerm
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL."
        case .invalidResponse:
            return "Invalid Response."
        case .invalidData:
            return "Invalid JSON Data."
        case .invalidSearchTerm:
            return "Invalid Search Term."
        }
    }
}
