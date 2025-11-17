//
//  StockRowView.swift
//  stock
//
//  Created by Yousefzadeh Abbas on 13/11/25.
//

import SwiftUI

struct StockRowView: View {
    let stock: Stock

    var body: some View {
        HStack {
            // LEFT: symbol + name
            VStack(alignment: .leading, spacing: 4) {
                Text(stock.symbol)
                    .font(.headline)
                    .fontWeight(.semibold)

                Text(stock.name)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            // RIGHT: price + change pill
            VStack(alignment: .trailing, spacing: 4) {
                Text(stock.priceText)
                    .font(.headline)
                    .fontWeight(.semibold)

                Text(stock.changeText)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(stock.isPositive ? Color.green : Color.red)
                    .cornerRadius(8)
                    .foregroundColor(.white)
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    StockRowView(
        stock: Stock(symbol: "AAPL",
                     name: "Apple Inc.",
                     price: 273.72,
                     change: 0.25)
    )
    .preferredColorScheme(.dark)
    .background(Color.black)
}



