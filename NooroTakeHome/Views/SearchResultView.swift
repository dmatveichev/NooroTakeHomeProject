//
//  SearchResultView.swift
//  NooroTakeHome
//
//  Created by Dmitry Matveichev on 12/13/24.
//


import SwiftUI

struct SearchResultView: View {
    let weather: WeatherResponse

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(weather.location.name)
                    .font(.poppinsMedium(size: 20))
                    .foregroundColor(.weatherText)
                HStack {
                    Text("\(Int(weather.current.tempC))")
                        .font(.poppinsMedium(size: 60))
                        .foregroundColor(.weatherText)
                    Text("°")
                        .font(.poppinsMedium(size: 20))
                }
            }
            .padding(16)

            Spacer()

            AsyncImageView(
                url: URL(string: "https:\(weather.current.condition.icon)"),
                placeholder: Image(systemName: "photo"),
                errorImage: Image(systemName: "xmark.octagon"),
                size: CGSize(width: 83, height: 80)
            )
        }
        .background(Color.weatherBackground)
        .cornerRadius(16)
        .padding(16)
    }
}
