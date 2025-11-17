//
//  ContentView.swift
//  stock
//
//  Created by Yousefzadeh Abbas on 13/11/25.
//

import SwiftUI

struct ContentView: View {
    
    //@State private var showNews = true
    @State private var sheetExpansion: CGFloat = 0   // 0 = collapsed, 1 = expanded
    var body: some View {
        
        GeometryReader { geo in
            
            ZStack (alignment: .bottom){
                
                Color.black.ignoresSafeArea()
                
                VStack  (spacing: 0){
                    
                    HeaderView()
                    
                    //Spacer()
                    
                    List(sampleStocks) {stock in
                        StockRowView(stock: stock)
                            .listRowBackground(Color.black)
                    }
                    .listStyle(PlainListStyle())
                    //.scrollContentBackground(.hidden)
                    .foregroundColor(Color.white)
                    
                    Color.black
                        .opacity(Double(0.4 * sheetExpansion))  // darker when expanded
                        .ignoresSafeArea()
                        .allowsHitTesting(false)
                }
                DraggableNewsSheet(
                    containerHeight: geo.size.height,
                    expansion: $sheetExpansion
                )
            }
            .background(Color.black.ignoresSafeArea())
            
        }
    }
}



#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
