//
//  Stock.swift
//  stock
//
//  Created by Yousefzadeh Abbas on 13/11/25.
//

import Foundation

struct Stock: Identifiable {
    let id = UUID()
    let symbol: String      // "AAPL"
    let name: String        // "Apple Inc."
    let price: Double       // 273.72
    let change: Double      // +0.25 or -611.65
}

extension Stock {
    var isPositive: Bool { change >= 0 }

    var changeText: String {
        String(format: "%+.2f", change)  // "+0.25" / "-611.65"
    }

    var priceText: String {
        String(format: "%.2f", price)
    }
}
