//
//  HeaderView.swift
//  Vita
//
//  Created by Sam on 29/1/2022.
//


import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text(Date().formatted(date: .abbreviated, time: .omitted)) //Date
                        .font(.callout)
                        .foregroundColor(Color(.systemGray2))
                    Text(greetingLogic()) //Greeting varies from time
                        .font(.callout)
                        .foregroundColor(Color(.systemGray2))
                }
                Text("Sharon Huang") //Name of user
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color(.black))
            }
            Spacer()
            Image("Girl") //Image of user
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 65, height:65)
                .cornerRadius(10)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        }
        .padding(.horizontal)
    }
    
    func greetingLogic() -> String {
      let hour = Calendar.current.component(.hour, from: Date())
      
      let NEW_DAY = 0
      let NOON = 12
      let SUNSET = 18
      let MIDNIGHT = 24
      
      var greetingText = "Hello" // Default greeting text
      switch hour {
      case NEW_DAY..<NOON:
          greetingText = "Good Morning,"
      case NOON..<SUNSET:
          greetingText = "Good Afternoon,"
      case SUNSET..<MIDNIGHT:
          greetingText = "Good Evening,"
      default:
          _ = "Hello,"
      }
      
      return greetingText
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
