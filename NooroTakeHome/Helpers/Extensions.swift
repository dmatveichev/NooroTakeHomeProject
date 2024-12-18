//
//  Extensions.swift
//  NooroTakeHome
//
//  Created by Dmitry Matveichev on 12/14/24.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }

    public static var weatherText: Color {
        Color(hex: "#2C2C2C")
    }
    
    public static var weatherSubtitle: Color {
        Color(hex: "#C4C4C4")
    }
    
    public static var weatherSubtitle2: Color {
        Color(hex: "#9A9A9A")
    }
    
    public static var weatherBackground: Color {
        Color(hex: "#F2F2F2")
    }
}

extension Font {
    static func poppinsMedium(size: CGFloat) -> Font {
        return .custom("Poppins-Medium", size: size)
    }
    
    static func poppinsBold(size: CGFloat) -> Font {
        return .custom("Poppins-Bold", size: size)
    }
    
    static func poppinsRegular(size: CGFloat) -> Font {
        return .custom("Poppins-Regular", size: size)
    }
}

extension WeatherDetailsView {
    func windArrowRotation(for direction: String) -> Double? {
        switch direction {
        case "N": return 0
        case "NNE": return 22.5
        case "NE": return 45
        case "ENE": return 67.5
        case "E": return 90
        case "ESE": return 112.5
        case "SE": return 135
        case "SSE": return 157.5
        case "S": return 180
        case "SSW": return 202.5
        case "SW": return 225
        case "WSW": return 247.5
        case "W": return 270
        case "WNW": return 292.5
        case "NW": return 315
        case "NNW": return 337.5
        default: return nil
        }
    }
}
