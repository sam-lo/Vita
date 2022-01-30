//
//  TodayView.swift
//  Vita
//
//  Created by Sam on 29/1/2022.
//

import SwiftUI

struct TodayView: View {
    var body: some View {
        TodayHeader()
    }
}

struct TodayHeader: View {
    var body: some View {
        HStack {
            Image(systemName: "calendar")
                .resizable()
                .frame(width: 30.0, height: 30.0)
                .foregroundColor(Color.blue)
            Text("Today")
                .font(.title)
            Spacer()
            Text("13")
                .font(.title)
                .bold()
        }
        .padding()
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}
