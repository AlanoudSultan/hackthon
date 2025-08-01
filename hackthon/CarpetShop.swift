//
//  CarpetShop.swift
//  hackthon
//
//  Created by حصه العجالين on 07/02/1447 AH.
//

import SwiftUI

struct CarpetShop: View {
    var body: some View {
        NavigationView {
            ZStack {
                // الخلفية
                Image("carpet")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    CarpetShop()
}
