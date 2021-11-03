//
//  CustomNightBackground.swift
//  dreams
//
//  Created by Alina Potapova on 31.10.2021.
//

import SwiftUI

struct CustomNightBackground: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.darkPurpleBackground, .lightPurpleBackground]), startPoint: .center, endPoint: .bottom)
                .ignoresSafeArea()
            StarsBackground()
            CloudBackground()
        }
    }
}


// MARK: - Cloud Shape
struct Cloud: Shape {
    func path(in rect: CGRect) -> Path {

        Path { path in
            path.move(to: CGPoint(x: rect.minX + 0.81028 * rect.width, y: rect.minY + 0.39009 * rect.height))
            path.addCurve(to: CGPoint(x: rect.minX + 0.77271 * rect.width, y: rect.minY + 0.39612 * rect.height), control1: CGPoint(x: rect.minX + 0.79766 * rect.width, y: rect.minY + 0.39009 * rect.height), control2: CGPoint(x: rect.minX + 0.78507 * rect.width, y: rect.minY + 0.39210 * rect.height))
            path.addCurve(to: CGPoint(x: rect.minX + 0.69093 * rect.width, y: rect.minY + 0.22300 * rect.height), control1: CGPoint(x: rect.minX + 0.76339 * rect.width, y: rect.minY + 0.32133 * rect.height), control2: CGPoint(x: rect.minX + 0.73325 * rect.width, y: rect.minY + 0.25753 * rect.height))
            path.addCurve(to: CGPoint(x: rect.minX + 0.55572 * rect.width, y: rect.minY + 0.21906 * rect.height), control1: CGPoint(x: rect.minX + 0.64862 * rect.width, y: rect.minY + 0.18847 * rect.height), control2: CGPoint(x: rect.minX + 0.59879 * rect.width, y: rect.minY + 0.18702 * rect.height))
            path.addCurve(to: CGPoint(x: rect.minX + 0.29076 * rect.width, y: rect.minY + 0.02004 * rect.height), control1: CGPoint(x: rect.minX + 0.51674 * rect.width, y: rect.minY + 0.04650 * rect.height), control2: CGPoint(x: rect.minX + 0.39812 * rect.width, y: rect.minY + -0.04260 * rect.height))
            path.addCurve(to: CGPoint(x: rect.minX + 0.16694 * rect.width, y: rect.minY + 0.44594 * rect.height), control1: CGPoint(x: rect.minX + 0.18340 * rect.width, y: rect.minY + 0.08269 * rect.height), control2: CGPoint(x: rect.minX + 0.12797 * rect.width, y: rect.minY + 0.27339 * rect.height))
            path.addCurve(to: CGPoint(x: rect.minX + 0.00002 * rect.width, y: rect.minY + 0.72706 * rect.height), control1: CGPoint(x: rect.minX + 0.07290 * rect.width, y: rect.minY + 0.45072 * rect.height), control2: CGPoint(x: rect.minX + -0.00139 * rect.width, y: rect.minY + 0.57584 * rect.height))
            path.addCurve(to: CGPoint(x: rect.minX + 0.17212 * rect.width, y: rect.minY + 1.00000 * rect.height), control1: CGPoint(x: rect.minX + 0.00143 * rect.width, y: rect.minY + 0.87829 * rect.height), control2: CGPoint(x: rect.minX + 0.07803 * rect.width, y: rect.minY + 0.99976 * rect.height))
            path.addLine(to: CGPoint(x: rect.minX + 0.81028 * rect.width, y: rect.minY + 1.00000 * rect.height))
            path.addCurve(to: CGPoint(x: rect.minX + 1.00000 * rect.width, y: rect.minY + 0.69504 * rect.height), control1: CGPoint(x: rect.minX + 0.91505 * rect.width, y: rect.minY + 1.00000 * rect.height), control2: CGPoint(x: rect.minX + 1.00000 * rect.width, y: rect.minY + 0.86347 * rect.height))
            path.addCurve(to: CGPoint(x: rect.minX + 0.81028 * rect.width, y: rect.minY + 0.39009 * rect.height), control1: CGPoint(x: rect.minX + 1.00000 * rect.width, y: rect.minY + 0.52662 * rect.height), control2: CGPoint(x: rect.minX + 0.91505 * rect.width, y: rect.minY + 0.39009 * rect.height))

        }
    }
}


// MARK: - Cloud View
struct CloudBackground: View {
    var body: some View {
        ZStack {
            Cloud()
                .foregroundColor(.leftLargeFirstCloudBackground)
                .frame(width: 600, height: 330)
                .offset(x: -170, y: 310)
            Cloud()
                .foregroundColor(.leftLargeSecondCloudBackground)
                .frame(width: 600, height: 330)
                .offset(x: -200, y: 350)
        }
    }
}


// MARK: - Stars
struct StarsBackground: View {
    let smallStarsCoordinats: [[CGFloat]] =
    [
        [-170, -290],
        [80, -290],
        [-100, -230],
        [-150, -180],
        [-140, -90],
        [-170, 30],
        [-180, 130],
        [-130, 140],
        [-20, 160],
        [-100, 100],
        [-130, -30],
        [130, -220],
        [-70, -320],
        [175, 0],
        [100, -85],
        [-80, -130],
        [70, 130],
        [120, 120],
        [100, 250],
        [180, 280],
        [160, 180]
    ]
    
    let bigStarsCoordinats: [[CGFloat]] =
    [
        [-0, -300],
        [50, -350],
        [-150, -330],
        [-140, -250],
        [-80, -182],
        [-160, -150],
        [80, -170],
        [-170, 0],
        [-140, 60],
        [-90, 150],
        [10, -140],
        [150, -120],
        [170, -340],
        [120, -40],
        [110, 60],
        [180, 100],
        [-10, 105],
        [-182, -70],
        [100, 180],
        [150, 310],
        [130, 270],
        [90, 300]
    ]
    
    var body: some View {
        ZStack {
            ForEach(smallStarsCoordinats, id:\.self) { coor in
                Circle()
                    .foregroundColor(.white)
                    .frame(width: 1.5, height: 1.5)
                    .offset(x: coor[0], y: coor[1])
            }
            
            ForEach(bigStarsCoordinats, id:\.self) { coor in
                Circle()
                    .foregroundColor(.white)
                    .frame(width: 3, height: 3)
                    .offset(x: coor[0], y: coor[1])
            }
            
            
        }
    }
}


struct CustomNightBackground_Previews: PreviewProvider {
    static var previews: some View {
        CustomNightBackground()
    }
}
