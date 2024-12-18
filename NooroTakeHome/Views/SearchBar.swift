//
//  SearchBar.swift
//  NooroTakeHome
//
//  Created by Dmitry Matveichev on 12/13/24.
//


import SwiftUI

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            TextField("Search Location", text: $text)
                .padding(.horizontal, 24)
                .frame(height: 46)
                .background(Color.weatherBackground)
                .font(.custom("Poppins-Regular", size: 14))
                .cornerRadius(16)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                            .padding(.trailing, 8)
                    }
                )
                .padding(.horizontal, 10)
        }
    }
}
