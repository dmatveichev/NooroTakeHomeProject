//
//  WeatherDetailsView.swift
//  NooroTakeHome
//
//  Created by Dmitry Matveichev on 12/13/24.
//

import SwiftUI

struct WeatherDetailsView: View {
    let weather: WeatherResponse
    
    var body: some View {
        VStack(spacing: 16) {
            AsyncImageView(
                url: URL(string: "https:\(weather.current.condition.icon)"),
                placeholder: Image(systemName: "photo"),
                errorImage: Image(systemName: "xmark.octagon"),
                size: CGSize(width: 160, height: 160)
            )
            HStack {
                Text(weather.location.name)
                    .font(.poppinsMedium(size: 30))
                    .foregroundColor(.weatherText)
                
                if let windArrowRotation = windArrowRotation(for: weather.current.windDir) {
                    Image("WindArrow")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .rotationEffect(Angle(degrees: windArrowRotation - 45))
                }
            }
            HStack {
                Text("\(Int(weather.current.tempC))")
                    .font(.poppinsMedium(size: 70))
                    .foregroundColor(.weatherText)
                Text("°")
                    .font(.poppinsMedium(size: 20))
            }
            ConditionDetailsView(humidity: weather.current.humidity,
                                 uvIndex: weather.current.uv,
                                 feelsLikeTemp: weather.current.feelslikeF)
        }
        .padding()
    }
}
