//
//  HeaderView.swift
//  stock
//
//  Created by Yousefzadeh Abbas on 13/11/25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            // LEFT SIDE: Title + date
            VStack(alignment: .leading, spacing: 4) {
                Text("Stocks")
                    .font(.largeTitle)        // large title, like iOS system apps
                    .fontWeight(.bold)
                    .foregroundStyle(.primary)

                Text("13 November")
                    .font(.title3)           // smaller than main title
                    .foregroundStyle(.secondary)
            }

            Spacer() // pushes the pill to the right

            // RIGHT SIDE: pill containing SF Symbols
            HStack(spacing: 16) {
                Image(systemName: "magnifyingglass")
                Image(systemName: "ellipsis")
            }
            .font(.title2)                      // icon size
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            //.background(.ultraThickMaterial)    // blurred card-like background
            .clipShape(Capsule())               // pill shape, as HIG suggests
        }
        .padding(.horizontal)
        .padding(.top)
        .background(Color.black.ignoresSafeArea())
        .foregroundColor(.white)
    }
}

#Preview {
    HeaderView()
        .preferredColorScheme(.dark) // matches the screenshot
}


