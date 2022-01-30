//
//  ContentView.swift
//  Vita
//
//  Created by Sam on 29/1/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                HeaderView()
                    .padding(.top)
                    HStack {
                            NavigationLink(destination: TodayView(), label: {
                                CardView(icon: "calendar", text: "Today", count: "13", color: Color.blue)
                            })
                            Spacer()
                                .frame(width: 20)
                            NavigationLink(destination: ArchiveView(), label: {
                                CardView(icon: "tray.and.arrow.down.fill", text: "Archive", count: "87", color: Color.blue)
                            })
                    }
                    Spacer()
                    HStack {
                        Image(systemName: "plus.square.fill")
                            .font(.title)
                            .foregroundColor(Color.blue)
                            .padding(.leading)
                        Text("Add New")
                            .font(.system(.title, design: .rounded))
                            .foregroundColor(Color.blue)
                            .bold()
                        Spacer()
                    }
            }
            .navigationBarHidden(true)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
