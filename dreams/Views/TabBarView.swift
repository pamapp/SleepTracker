//
//  TabBarView.swift
//  dreams
//
//  Created by Alina Potapova on 22.10.2021.
//

import SwiftUI

struct TabBarView: View {
    @Binding var pages: [TabBarPage]
    @Binding var showingHelloView: Bool
    @State var selectedTab = "Dreams"
    
    init(pages: Binding<[TabBarPage]>, showingHelloView: Binding<Bool>) {
        UITabBar.appearance().isHidden = true
        self._pages = pages
        self._showingHelloView = showingHelloView
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                ForEach(pages) { item in
                    AnyView(_fromValue: item.page)
                        .tabItem {
                            EmptyView()
                        }.tag(item.tag)
                }
            }
            
            HStack {
                ForEach(pages) { item in
                    Button(action: {
                        self.selectedTab = item.tag
                        
                        if item.tag == "Dreams" {
                            self.showingHelloView = true
                        } else {
                            self.showingHelloView = false
                        }
                    }) {
                        VStack {
                            Image(systemName: item.icon)
                                .foregroundColor(self.selectedTab == item.tag ? .dirtyWhite : .lightTimeColor)
                                .font(Font.system(size: 28))
                                
                        }.padding(10)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.top, 5)
            .padding(.bottom, 20)
            .background(Color.tabPurple)
            .cornerRadius(25)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct TabBarPage: Identifiable {
    var id = UUID()
    var page: Any
    var icon: String
    var tag: String
}
