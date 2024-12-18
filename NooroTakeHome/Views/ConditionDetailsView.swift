//
//  ConditionDetailsView.swift
//  NooroTakeHome
//
//  Created by Dmitry Matveichev on 12/14/24.
//

import SwiftUI

struct ConditionDetailsView: View {
    let humidity: Int
    let uvIndex: Double
    let feelsLikeTemp: Double
    
    var body: some View {
        HStack {
            WeatherInfoItemView(title: "Humidity", value: "\(humidity)%")
            Spacer()
            WeatherInfoItemView(title: "UV Index", value: String(format: "%.1f", uvIndex))
            Spacer()
            WeatherInfoItemView(title: "Feels Like", value: "\(Int(feelsLikeTemp))")
        }
        .frame(width: 274, height: 75)
        .padding(16)
        .background(Color.weatherBackground)
        .cornerRadius(16)
    }
}

struct WeatherInfoItemView: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.poppinsMedium(size: 12))
                .foregroundColor(.weatherSubtitle)
            Text(value)
                .font(.poppinsRegular(size: 15))
                .foregroundColor(.weatherSubtitle2)
        }
    }
}
