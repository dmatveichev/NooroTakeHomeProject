//
//  AsyncImageView.swift
//  NooroTakeHome
//
//  Created by Dmitry Matveichev on 12/13/24.
//

import SwiftUI

struct AsyncImageView: View {
    let url: URL?
    let placeholder: Image
    let errorImage: Image
    let size: CGSize

    var body: some View {
        if let url = url {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    placeholder
                        .resizable()
                        .scaledToFit()
                        .frame(width: size.width, height: size.height)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: size.width, height: size.height)
                case .failure:
                    errorImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: size.width, height: size.height)
                        .foregroundColor(.red)
                @unknown default:
                    EmptyView()
                }
            }
        } else {
            errorImage
                .resizable()
                .scaledToFit()
                .frame(width: size.width, height: size.height)
                .foregroundColor(.gray)
        }
    }
}
