//
//  StatsView.swift
//  dreams
//
//  Created by Alina Potapova on 30.10.2021.
//


import SwiftUI
import Combine

struct StatsView: View {
    let heights: [CGFloat] = [104, 58, 94, 122, 109, 72, 149]
    var body: some View {
        ZStack {
            CustomNightBackground()
            VStack(alignment: .leading, spacing: 30) {
                Spacer().frame(height: 10)
                
                Text("Statistics")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.dirtyWhite)
                    .font(.montserrat(24))

                VStack(alignment: .leading) {
                    Text("WEEKLY SLEEP")
                        .font(.system(size: 12, weight: .bold))
                        .font(.montserrat(12))
                        .foregroundColor(.dirtyWhite)
                        .padding(.bottom, -20)
                   
                    ZStack {
                        TableView()
                        HStack(alignment: .bottom) {
                            Spacer()
                            ForEach(heights, id: \.self) { item in
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 28, height: item)
                                    .foregroundColor(.chartRects)
                                    .padding(.top, -15)
                                if item != heights.last {
                                    Spacer().frame(width: 15)
                                } else {
                                    Spacer().frame(width: 1.5)
                                }
                            }
                        }.frame(width: 305)
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("DAILY SLEEP")
                        .font(.system(size: 12, weight: .bold))
                        .font(.montserrat(12))
                        .foregroundColor(.dirtyWhite)
                        .padding(.bottom, 10)
                    HStack {
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(.leftLargeSecondCloudBackground)
                            .frame(width: 160, height: 160)
                            .overlay(
                                VStack(alignment: .leading) {
                                    Text("Quality")
                                        .foregroundColor(.dirtyWhite)
                                        .font(.system(size: 22, weight: .bold))
                                        .font(.montserrat(22))
                                    Spacer()
                                    Text("68%")
                                        .foregroundColor(.dirtyWhite)
                                        .font(.system(size: 20, weight: .bold))
                                        .font(.montserrat(20))
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 5)
                                            .frame(width: 120, height: 5)
                                            .foregroundColor(.dirtyWhite)
                                            .padding(.bottom, 10)
                                        HStack() {
                                            RoundedRectangle(cornerRadius: 5)
                                                .frame(width: 78, height: 5)
                                                .foregroundColor(.chartRects)
                                                .padding(.bottom, 10)
                                            Spacer()
                                        }
                                    }
                                }.frame(width: 120, height: 120, alignment: .leading)
                            )
                        
                        Spacer()
                        
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(.leftLargeSecondCloudBackground)
                            .frame(width: 160, height: 160)
                            .overlay(
                                VStack(alignment: .leading) {
                                    Text("Duration")
                                        .foregroundColor(.dirtyWhite)
                                        .font(.system(size: 22, weight: .bold))
                                        .font(.montserrat(22))
                                    Spacer()
                                    Text("7h 32m")
                                        .foregroundColor(.dirtyWhite)
                                        .font(.system(size: 20, weight: .bold))
                                        .font(.montserrat(20))
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 5)
                                            .frame(width: 120, height: 5)
                                            .foregroundColor(.dirtyWhite)
                                            .padding(.bottom, 10)
                                        HStack() {
                                            RoundedRectangle(cornerRadius: 5)
                                                .frame(width: 98, height: 5)
                                                .foregroundColor(.chartRects)
                                                .padding(.bottom, 10)
                                            Spacer()
                                        }
                                    }
                                
                                }.frame(width: 120, height: 120, alignment: .leading)
                            )
                    }.frame(width: 340, height: 160)
                }
                Spacer()
            }
        }
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
