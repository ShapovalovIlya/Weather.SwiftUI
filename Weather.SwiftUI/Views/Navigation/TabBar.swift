//
//  TabBar.swift
//  Weather.SwiftUI
//
//  Created by Илья Шаповалов on 17.09.2022.
//

import SwiftUI

struct TabBar: View {
    var action: () -> Void
    var body: some View {
        ZStack {
            HStack {
                //MARK: - Expand button
                Button {
                    action()
                } label: {
                    Image(systemName: "mappin.and.ellipse")
                        .frame(width: 44, height: 44)
                }
                
                Spacer()
                
                //MARK: - Navigation Link
                NavigationLink {
                    
                } label: {
                    Image(systemName: "list.star")
                        .frame(width: 44, height: 44)
                }

            } // end of HStack
            .font(.title2)
            .foregroundColor(.white)
            .padding(EdgeInsets(top: 20, leading: 42, bottom: 24, trailing: 42))
        } // end of ZStack
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
    } // end of body
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(action: {})
            .preferredColorScheme(.dark)
    }
}
