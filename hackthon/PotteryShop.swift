//
//  PotteryShop.swift
//  hackthon
//
//  Created by حصه العجالين on 07/02/1447 AH.
//

import SwiftUI

struct PotteryShop: View {
    var body: some View {
        NavigationView {
            ZStack {
                // الخلفية
                Image("pottery")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    PotteryShop()
}
