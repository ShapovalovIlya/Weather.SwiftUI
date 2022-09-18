//
//  HomeView.swift
//  Weather.SwiftUI
//
//  Created by Илья Шаповалов on 17.09.2022.
//

import SwiftUI
import BottomSheet

enum BottomSheetPosition: CGFloat, CaseIterable {
    case top = 0.83
    case middle = 0.385
}

struct HomeView: View {
    
    @State var bottomSheetPosition: BottomSheetPosition = .middle
    
    var body: some View {
        NavigationView {
            ZStack {
                //MARK: - Background color
                Color.background
                    .ignoresSafeArea()
                
                //MARK: - Background image
                Image("Background")
                    .ignoresSafeArea()
                
                //MARK: - House image
                Image("House")
                    .frame(maxWidth: .infinity, alignment: .top)
                    .padding(.top, 257)
                
                VStack(spacing: -10) {
                    Text("Saint-P")
                        .font(.largeTitle)
                    
                    VStack {
                        Text(attributedString)
                        
                        Text("H:24° L:18°")
                            .font(.title3.weight(.semibold))
                    } // end of VStack
                    
                    Spacer()
                } // end of VStack
                .padding(.top, 51)
                
                //MARK: - Bottom Sheet
                BottomSheetView(position: $bottomSheetPosition) {
                    Text(bottomSheetPosition.rawValue.formatted())
                } content: {
                    ForecastView()
                }

                
                //MARK: - Tab bar
                TabBar(action: {
                    bottomSheetPosition = .top
                })
            } // end of ZStack
        } // end of NavigationView
        .toolbar(.hidden)
    } // end of body
    
    private var attributedString: AttributedString {
        var string = AttributedString("19°" + "\n" + "Mostly clear")
        
        if let temp = string.range(of: "19°") {
            string[temp].font = .system(size: 96, weight: .thin)
            string[temp].foregroundColor = .primary
        }
        
        if let pipe = string.range(of: " | ") {
            string[pipe].font = .title3.weight(.semibold)
            string[pipe].foregroundColor = .secondary
        }
        
        if let weather = string.range(of: "Mostly clear") {
            string[weather].font = .title3.weight(.semibold)
            string[weather].foregroundColor = .secondary
        }
        
        return string
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
