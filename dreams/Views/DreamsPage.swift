//
//  DreamsPage.swift
//  dreams
//
//  Created by Alina Potapova on 22.10.2021.
//

import SwiftUI
import CoreGraphics

struct DreamsPage: View {
    @State var date = Date()
    @Binding var isSleepStatus: Bool
    
    @ObservedObject var stopWatchManager = StopWatchManager()
    
    @State var positionX = UIScreen.main.bounds.width/2 + 35
    
    var body: some View {
        ZStack {
            CustomNightBackground()
            
            if isSleepStatus {
                VStack(alignment: .center, spacing: 90) {
                    VStack {
                        Text("Good night, Alina")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.dirtyWhite)
                            .font(.montserrat(24))
                            .padding(.bottom, 1)
                        
                        Text("Alarm 08:15 AM")
                            .foregroundColor(.lightTimeColor)
                            .font(.montserrat(16))
                    }
                    
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 0.3)
                            .frame(width: 200, height: 200, alignment: .center)
                            .foregroundColor(.dirtyWhite)
                            .overlay(
                                ZStack {
                                    Text("\(timeString(date: date))")
                                        .onAppear(perform: { let _ = self.updateTimer })
                                        .foregroundColor(.white)
                                        .font(.montserrat())
                                    Circle()
                                        .mask(MoonMask().fill(style: FillStyle(eoFill: true)))
                                        .frame(width: 200, height: 200)
                                        .foregroundColor(Color.dirtyWhite)
                                        .padding()
                                        .background(Color.clear)
                                        .rotationEffect(.degrees(-22))
                                }
                            )
                        VStack {
                            Cloud()
                                .foregroundColor(.dirtyWhite)
                                .opacity(30)
                                .frame(width: 50, height: 25)
                                .offset(x: CGFloat(positionX))
                                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: false).speed(0.02))
                                .onAppear() {
                                    positionX -= UIScreen.main.bounds.width + 70
                                }
                            Spacer().frame(height: 150)
                            Cloud()
                                .foregroundColor(.dirtyWhite)
                                .opacity(30)
                                .frame(width: 100, height: 50)
                                .offset(x: CGFloat(positionX))
                                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: false).speed(0.03))
                                .onAppear() {
                                    positionX -= UIScreen.main.bounds.width + 70
                                }
                        }
                    }
                

                    VStack {
                        Text("Sleep duration")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .bold))
                            .font(.montserrat(15))

                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.lightButton)
                            .frame(width: 150, height: 40)
                            .overlay(
                                Text(String(format: "%:1f", stopWatchManager.secondsElapsed))
                                    .foregroundColor(.white)
                                    .onAppear(perform: { self.stopWatchManager.stop() })
                            )
                        
                        Spacer().frame(height: 25)
                        
                        Button(action: {
                            self.isSleepStatus.toggle()
                        }, label: {
                            RoundedRectangle(cornerRadius: 22)
                                .foregroundColor(.dirtyWhite)
                                .frame(width: 260, height: 60)
                                .overlay(
                                    Text("Stop tracking")
                                        .foregroundColor(.tabPurple)
                                        .font(.system(size: 18, weight: .bold))
                                        .font(.montserrat(18))
                                )
                        })
                        
                        Button(action: {
                            self.stopWatchManager.start()
                        }, label: {
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: 220, height: 40)
                                .foregroundColor(.dirtyWhite)
                                .overlay(
                                    Text("Start tracking")
                                        .foregroundColor(.tabPurple)
                                        .font(.system(size: 18, weight: .bold))
                                        .font(.montserrat(18))
                                )
                        })
                    }
                }
            } else {
                VStack(alignment: .leading, spacing: 30) {
                    Text("\(dayString(date: date))")
                        .onAppear(perform: { let _ = self.updateTimer })
                        .foregroundColor(.dirtyWhite)
                        .font(.system(size: 24, weight: .bold))
                        .font(.montserrat())
                        .padding(.top, 40)
                    
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(.leftLargeSecondCloudBackground)
                        .frame(width: 340, height: 160)
                        .overlay(
                            VStack(alignment: .leading, spacing: 10) {
                                Text("\(weekDayString(date: date))")
                                    .onAppear(perform: { let _ = self.updateTimer })
                                    .foregroundColor(.dirtyWhite)
                                    .font(.system(size: 24, weight: .bold))
                                    .font(.montserrat())
                            
                                Text("Sleep time: 11:30pm - 08:30am")
                                    .foregroundColor(.lightTimeColor)
                                    .font(.montserrat(16))
                                    .tracking(1.05)
                                
                                Spacer()
                            
                                HStack() {
                                    Spacer()
                                    
                                    Button(action: {
                                        self.isSleepStatus.toggle()
                                        self.stopWatchManager.start()
                                        print(stopWatchManager.mode)
                                    }, label: {
                                        RoundedRectangle(cornerRadius: 15)
                                            .frame(width: 220, height: 40)
                                            .foregroundColor(.dirtyWhite)
                                            .overlay(
                                                Text("Start tracking")
                                                    .foregroundColor(.tabPurple)
                                                    .font(.system(size: 18, weight: .bold))
                                                    .font(.montserrat(18))
                                            )
                                    })
                               }
                            }.frame(width: 300, height: 120, alignment: .leading)
                        )
                    
                    Text("SETTINGS")
                        .font(.system(size: 12, weight: .bold))
                        .font(.montserrat(12))
                        .foregroundColor(.dirtyWhite)
                        .padding(.bottom, -30)
                    
                    HStack {
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
                                    Text("7h")
                                        .foregroundColor(.dirtyWhite)
                                        .font(.system(size: 32, weight: .bold))
                                        .font(.montserrat(32))
                                    Spacer()
                                }.frame(width: 120, height: 120, alignment: .leading)
                            )
                        
                        Spacer()
                        
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(.leftLargeSecondCloudBackground)
                            .frame(width: 160, height: 160)
                            .overlay(
                                VStack(alignment: .leading) {
                                    Text("Meditation")
                                        .foregroundColor(.dirtyWhite)
                                        .font(.system(size: 22, weight: .bold))
                                        .font(.montserrat(22))
                                    Spacer()
                                    Text("Rain")
                                        .foregroundColor(.dirtyWhite)
                                        .font(.system(size: 32, weight: .bold))
                                        .font(.montserrat(32))
                                    Spacer()
                                }.frame(width: 120, height: 120, alignment: .leading)
                            )
                    }.frame(width: 340, height: 160)
                    
                    Spacer()
                }
            }
        }
    }
    
    var timeFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }
    
    var dayFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd, MMMM"
        return formatter
    }
    
    var weekDayFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter
    }
    
    func timeString(date: Date) -> String {
         let time = timeFormat.string(from: date)
         return time
    }
    
    func dayString(date: Date) -> String {
         let time = dayFormat.string(from: date)
         return time
    }
    
    func weekDayString(date: Date) -> String {
         let time = weekDayFormat.string(from: date)
         return time
    }
    
    var updateTimer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in  self.date = Date() })
    }
}

struct MoonMask: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Rectangle().path(in: rect)
        path.addPath(Circle().path(in: rect.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 10))
            .offsetBy(dx: 50, dy: -10)))
        return path
    }
}

class StopWatchManager: ObservableObject {
    
    @Published var mode: stopWatchMode = .stopped
    
    @Published var secondsElapsed = 0.0
    
    var timer = Timer()
    
    func start() {
        mode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.secondsElapsed += 0.1
        }
    }
    
    func pause() {
         timer.invalidate()
         mode = .paused
     }
     
    func stop() {
        timer.invalidate()
        secondsElapsed = 0
        mode = .stopped
    }
}

enum stopWatchMode {
    case running
    case stopped
    case paused
}
