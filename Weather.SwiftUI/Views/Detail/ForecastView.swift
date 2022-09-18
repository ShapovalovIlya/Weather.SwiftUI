//
//  ForecastView.swift
//  Weather.SwiftUI
//
//  Created by Илья Шаповалов on 17.09.2022.
//

import SwiftUI

struct ForecastView: View {
    var body: some View {
        ScrollView {
            
        } // end of Scroll view
        .background(Blur(radius: 25, opaque: true))
        .backgroundBlur(radius: 25, opaque: true)
        .clipShape(RoundedRectangle(cornerRadius: 44))
        .innerShadow(
            shape: RoundedRectangle(cornerRadius: 44),
            color: Color.bottomSheetBorderMiddle,
            lineWidth: 1,
            offsetX: 0,
            offsetY: 1,
            blur: 0,
            blendMode: .overlay,
            opacity: 1
        )
        .overlay {
            //MARK: - Bottom Sheet separator
            Divider()
                .blendMode(.overlay)
                .background(Color.bottomSheetBorderTop)
                .frame(maxHeight: .infinity, alignment: .top)
                .clipShape(RoundedRectangle(cornerRadius: 44))
        }
        .overlay {
            //MARK: - Drag indicator
            RoundedRectangle(cornerRadius: 10)
                .fill(.black.opacity(0.3))
                .frame(width: 40, height: 5)
                .frame(height: 20)
                .frame(maxHeight: .infinity, alignment: .top)
        }
    } // end of body
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView()
            .background(Color.background)
            .preferredColorScheme(.dark)
    }
}
