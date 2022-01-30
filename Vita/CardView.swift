//
//  MainCardView.swift
//  Vita
//
//  Created by Sam on 29/1/2022.
//

import SwiftUI

struct CardView: View {
    
    var icon: String
    var text: String
    var count: String
    var color: Color
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Image(systemName: icon)
                    .resizable()
                    .frame(width: 30.0, height: 30.0)
                    .padding(.trailing, 40.0)
                    .padding(.top, 5.0)
                    .foregroundColor(color)
                Text(count) //Event count of Today
                    .foregroundColor(.black)
                    .font(.title)
                    .bold()
            }
            Text(text)
                .foregroundColor(.black)
                .font(.title2)
        }
        .padding(.horizontal, 25.0)
        .padding(.vertical, 20.0)
        .background(Color(.systemGray5))
        .cornerRadius(20)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(icon: "calendar", text: "Today", count: "13", color: Color.blue)
    }
}
