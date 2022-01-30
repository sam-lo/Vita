//
//  ActionViewModel.swift
//  Vita
//
//  Created by Sam on 29/1/2022.
//

import SwiftUI

class ActionViewModel: ObservableObject{
    
    //example
    
    @Published var storedActions: [Action] = [
        
        Action(detail: "McDonald's", time: .init(timeIntervalSince1970: 164165497), magnitude: 3.0, type: "Eat"),
        Action(detail: "Fairwood", time: .init(timeIntervalSince1970: 164169097), magnitude: 4.0, type: "Eat")
        
    ]
    @Published var currentWeek: [Date] = []
    
    @Published var currentDay: Date = Date()
    
    @Published var filteredActions: [Action]?
    
    init(){
        fetchCurrentWeek()
        filterTodayAction()
    }
    
    func filterTodayAction(){
        
        DispatchQueue.global(qos: .userInteractive).async {
            
            let calendar = Calendar.current
            
            let filtered = self.storedActions.filter {
                return calendar.isDate($0.time, inSameDayAs: self.currentDay)
            }
            
            DispatchQueue.main.async {
                withAnimation {
                    self.filteredActions = filtered
                }
            }
        }
    }
    
    func fetchCurrentWeek(){
        let today = Date()
        let calendar = Calendar.current
        
        let week = calendar.dateInterval(of: .weekOfMonth, for: today)
        
        guard let firstWeekDay = week?.start else {
            return
        }
        (1...7).forEach { day in
            
            if let weekday = calendar.date(byAdding: .day, value: day, to: firstWeekDay) {
                currentWeek.append(weekday)
            }
        }
    }
    
    func extractDate(date: Date, format: String) -> String{
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        
        return formatter.string(from: date)
    }
    
    func isToday(date: Date)->Bool{
        
        let calendar = Calendar.current
        
        return calendar.isDate(currentDay, inSameDayAs: date)
        
    }
}
