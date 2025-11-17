import SwiftUI

struct DraggableNewsSheet: View {
    let containerHeight: CGFloat
    @Binding var expansion: CGFloat       // 0 = collapsed, 1 = expanded
    
    // how small / big the sheet can be (percentage of screen height)
    private let minHeightRatio: CGFloat = 0.18   // collapsed
    private let maxHeightRatio: CGFloat = 0.85  // expanded
    
    @State private var currentHeight: CGFloat = 0
    @State private var dragStartHeight: CGFloat = 0
    
    var body: some View {
        let minHeight = containerHeight * minHeightRatio
        let maxHeight = containerHeight * maxHeightRatio
        
        // shared drag logic
        let drag = DragGesture()
            .onChanged { value in
                let translation = value.translation.height
                // dragging up = negative translation → increase height
                let proposed = dragStartHeight - translation
                let clamped = min(max(proposed, minHeight), maxHeight)
                currentHeight = clamped
                updateExpansion(minHeight: minHeight, maxHeight: maxHeight)
            }
            .onEnded { _ in
                // snap with slight bias towards expanding
                let bias: CGFloat = 0.30
                let mid = minHeight + (maxHeight - minHeight) * bias
                
                if currentHeight > mid {
                    currentHeight = maxHeight   // expand
                } else {
                    currentHeight = minHeight   // collapse
                }
                dragStartHeight = currentHeight
                updateExpansion(minHeight: minHeight, maxHeight: maxHeight)
            }
        
        ZStack(alignment: .top) {
            // sheet content
            NewsView()
                .frame(maxWidth: .infinity)
                .frame(height: max(currentHeight, minHeight), alignment: .top)
                .background(.ultraThickMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                .shadow(radius: 20)   // 🔥 soft shadow under the sheet
            
            // drag zone: only the top area (handle + header)
            Rectangle()
                .fill(Color.clear)
                .frame(height: 44)
                .contentShape(Rectangle())
                .gesture(drag)
        }
        .animation(.spring(response: 0.35,
                           dampingFraction: 0.85),
                   value: currentHeight)
        .padding(.horizontal)
        .padding(.bottom, 8)
        .onAppear {
            // start collapsed
            let h = minHeight
            currentHeight = h
            dragStartHeight = h
            updateExpansion(minHeight: minHeight, maxHeight: maxHeight)
        }
    }
    
    private func updateExpansion(minHeight: CGFloat, maxHeight: CGFloat) {
        let clamped = min(max(currentHeight, minHeight), maxHeight)
        let range = maxHeight - minHeight
        if range > 0 {
            expansion = (clamped - minHeight) / range   // 0…1
        } else {
            expansion = 0
        }
    }
}

#Preview {
    GeometryReader { geo in
        ZStack(alignment: .bottom) {
            Color.black.ignoresSafeArea()
            DraggableNewsSheet(
                containerHeight: geo.size.height,
                expansion: .constant(0.5)
            )
        }
        .preferredColorScheme(.dark)
    }
}
