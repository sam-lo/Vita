//
//  ArchiveView.swift
//  Vita
//
//  Created by Sam on 30/1/2022.
//

import SwiftUI

struct ArchiveView: View {
    
    @StateObject var actionModel: ActionViewModel = ActionViewModel()
    @Namespace var animation
    
    var body: some View {
        
        LazyVStack(spacing: 15, pinnedViews: [.sectionHeaders]) {
            Section {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(actionModel.currentWeek, id: \.self){ day in
                            VStack(spacing: 10) {
                                
                                Text(actionModel.extractDate(date: day, format: "dd"))
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)
                                
                                Text(actionModel.extractDate(date: day, format: "EEE"))
                                    .font(.system(size: 14))
                                Circle()
                                    .fill(.white)
                                    .frame(width: 45, height: 8)
                                    .opacity(actionModel.isToday(date: day) ? 1 : 0)
                            }
                            .foregroundStyle(actionModel.isToday(date: day) ? .primary : .secondary)
                            .foregroundColor(actionModel.isToday(date: day) ? .white : .black)
                            .frame(width: 45, height: 90)
                            .background(
                                ZStack {
                                    if actionModel.isToday(date: day) {
                                        Capsule()
                                            .fill(.black)
                                            .matchedGeometryEffect(id: "CURRENTDAY", in: animation)
                                    }
                                }
                            )
                            .contentShape(Capsule())
                            .onTapGesture {
                                withAnimation {
                                    actionModel.currentDay = day
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            ActionsView()
        }
        
    }
    
    
    func ActionsView() -> some View {
        
        LazyVStack(spacing: 18) {
            
            if let actions = actionModel.filteredActions {
                
                if actions.isEmpty {
                    
                    Text("No Action Found")
                        .fontWeight(.light)
                        .font(.system(size: 16))
                        .offset(y: 100)
                    
                } else {
                    
                    ForEach(actions) { action in
                        ActionCardView(action: action)
                    }
                    
                }
                
            } else {
                
                ProgressView()
                    .offset(y: 100)
                
            }
        }
        .onChange(of: actionModel.currentDay) { newValue in
            actionModel.filterTodayAction()
        }
    }
    
    func ActionCardView(action: Action) -> some View {
        HStack {
            Text(action.type)
        }
    }
}

struct ArchiveView_Previews: PreviewProvider {
    static var previews: some View {
        ArchiveView()
    }
}
