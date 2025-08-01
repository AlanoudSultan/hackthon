//
//  map.swift
//  hackthon
//
//  Created by حصه العجالين on 07/02/1447 AH.
//

import SwiftUI

struct map: View {
    var body: some View {
        NavigationView {
            ZStack {
                // الخلفية
                Image("map") // تأكد إنك أضفت الصورة في Assets
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                // زر عند محل الفخار
                NavigationLink(destination: PotteryShop()) {
                    CircleButton()
                }
                .offset(x: -305, y: 99) // اضبط حسب موقع باب الفخار

                // زر عند محل السجاد
                NavigationLink(destination: CarpetShop()) {
                    CircleButton()
                }
                .offset(x: -70, y:99) // اضبط حسب موقع باب السجاد

                
            }
        }
    }
}

// زر دائري فيه أيقونة تشغيل
struct CircleButton: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.background.opacity(0.8))
                .frame(width: 50, height: 50)
                .shadow(radius: 4)
                .overlay(
                    Circle()
                        .stroke(Color("secondcolor"), lineWidth: 3)
                )
            
            Image(systemName: "play.fill")
                .foregroundColor(.secondcolor)
                .font(.system(size: 24))
        }
    }
}


#Preview {
    map()
}
