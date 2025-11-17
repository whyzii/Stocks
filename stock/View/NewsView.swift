import SwiftUI

struct NewsView: View {
    var body: some View {
        VStack(spacing: 0) {
            // drag handle
            Capsule()
                .frame(width: 40, height: 4)
                .foregroundStyle(.secondary)
                .padding(.top, 8)
                .padding(.bottom, 8)
            
            // HEADER
            VStack(alignment: .leading, spacing: 4) {
                Text("Business News")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("From Yahoo Finance")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            Divider()
                .padding(.top, 8)
            
            // SCROLLABLE CONTENT
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    // First “main” article
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Dow Jones")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        HStack(spacing: 8) {
                            Text("47,457.22")
                            Text("-797.60")
                                .foregroundColor(.red)
                        }
                        .font(.headline)
                        
                        Text("At Close")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.bottom, 16)
                    
                    Divider()
                    
                    // Example list of more articles
                    ForEach(0..<6) { index in
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Sample Article \(index + 1)")
                                .font(.headline)
                            
                            Text("Short description of stock market news goes here, similar to the real Stocks app.")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                            
                            Text("4h ago")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 8)
                        
                        if index != 5 {
                            Divider()
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 16)
            }
            //Text("From Yahoo Finance")
            .font(.subheadline)
            .foregroundStyle(.secondary)
            
            VStack {
                Image("yahoologo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 20)        // adjust based on your design
                    .padding(.top, 8)
                //Spacer()
            }
            
            
        }
    }
}

#Preview {
    NewsView()
        .preferredColorScheme(.dark)
        .background(Color.black)
}
