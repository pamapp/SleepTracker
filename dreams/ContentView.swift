//
//  ContentView.swift
//  dreams
//
//  Created by Alina Potapova on 20.10.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @EnvironmentObject private var dataController: DataController
    
//    @FetchRequest(entity: Memory.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Dream.date, ascending: false),]) var memories: FetchedResults<Dream>
//
//    @State private var selectedMemories = Set<Memory>()
//    @State private var showingAddMemoryView = false
    
    @State var showSecondView = false
    @State private var showingHelloView = true
    @State var isSleepStatus: Bool = false
    
    var body: some View {
            ZStack {
                if isSleepStatus {
                    DreamsPage(isSleepStatus: $isSleepStatus)
                } else {
                    TabBarView(pages: .constant([
                        TabBarPage(
                            page: DreamsPage(isSleepStatus: $isSleepStatus)
                                .preferredColorScheme(.dark),
                            icon: "bed.double.fill",
                            tag: "Dreams"
                        ),
                        TabBarPage(
                            page: StatsView(),
                            icon: "chart.bar.fill",
                            tag: "Stats"
                        ),
                        TabBarPage(
                            page: Text("Meditation")
                                .preferredColorScheme(.dark),
                            icon: "airpodpro.right",
                            tag: "Meditation"
                        )
                    ]), showingHelloView: $showingHelloView)
                    
//                    Button(action: {
//                        self.showSecondView.toggle()
//                    }, label: {
//                        Text("Change view")
//                    })
                    }
//
//                if self.showingHelloView {
//                    Text("Good night, Alina")
//                        .transition(.opacity)
//                        .font(.system(size: 24, weight: .bold))
//                        .offset(y: (showSecondView ? -240 : 0))
//                }
//            }
//            .onAppear() {
//                Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (_) in
//                    withAnimation {
//                        self.showSecondView = true
//                    }
//            }
        }
    }
}
