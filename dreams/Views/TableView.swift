//
//  TableView.swift
//  dreams
//
//  Created by Alina Potapova on 03.11.2021.
//

import SwiftUI

struct WeekDayValue {
    let id = UUID()
    let title: String
}

struct TableView: View {
    let weekDays =
    [
        WeekDayValue(title: "M"),
        WeekDayValue(title: "T"),
        WeekDayValue(title: "W"),
        WeekDayValue(title: "T"),
        WeekDayValue(title: "F"),
        WeekDayValue(title: "S"),
        WeekDayValue(title: "S"),
        WeekDayValue(title: "")
    ]
    let hours: [String] = ["9h", "8h", "7h", "6h"]
    var body: some View {
        ZStack {
            ZStack {
                HStack(alignment: .bottom) {
                    Spacer()
                    ForEach(1...weekDays.count, id: \.self) { item in
                        HStack (alignment: .bottom) {
                            Rectangle()
                                .frame(width: 3, height: 180)
                                .foregroundColor(.leftLargeSecondCloudBackground)
                            if item != 8 {
                                Spacer().frame(width: 20)
                            }
                        }
                        
                        if item != 8 {
                            Spacer().frame(width: 20)
                        }
                    }
                }
                .frame(width: 340, height: 225)
                .padding(.trailing, 10)
                
                VStack(alignment: .trailing) {
                    ForEach(1...hours.count, id: \.self) { item in
                        VStack(alignment: .leading) {
                            Spacer().frame(height: 20)

                            Rectangle()
                                .frame(width: 323, height: 3)
                                .foregroundColor(.leftLargeSecondCloudBackground)
                        }
                        
                        if item != 4 {
                            Spacer().frame(height: 20)
                        }
                    }
                }
                .frame(width: 340, height: 225)
                .padding(.bottom, 15)
            }.frame(width: 340, height: 225, alignment: .trailing)
            
            ZStack {
                VStack {
                    Spacer()
                    HStack(alignment: .bottom) {
                        Spacer()
                        ForEach(weekDays, id: \.id) { item in
                            if item.title != "" {
                                Spacer().frame(width: 32)
                                Text(item.title)
                                    .foregroundColor(.dirtyWhite)
                            } else {
                                Spacer().frame(width: 25)
                            }
                        }
                    }
                }.frame(width: 340, height: 180)

                HStack {
                    VStack(alignment: .leading) {
                        Spacer()
                        ForEach(hours, id: \.self) { item in
                            Text(item)
                               .foregroundColor(.dirtyWhite)
                            Spacer().frame(height: 23)
                        }
                        Spacer()
                    }
                    Spacer()
                }.frame(width: 340, height: 180)
            }.frame(width: 340, height: 225, alignment: .trailing)
        }
    }
}
