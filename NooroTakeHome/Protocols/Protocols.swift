//
//  Protocols.swift
//  NooroTakeHome
//
//  Created by Dmitry Matveichev on 12/13/24.
//

import Foundation

protocol NetworkServiceProtocol {
    func getWeatherInfo(searchTerm: String) async throws -> WeatherResponse
}

protocol URLSessionProtocol {
    func data(from url: URL) async throws -> (Data, URLResponse)
}
