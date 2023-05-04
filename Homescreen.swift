//
//  Homescreen.swift
//  Calorie Tracker (Test)
//
//  Created by Andres E. Lopez on 5/4/23.
//

import SwiftUI
struct Homescreen: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationView {
                ContentView()
            }
            .tabItem {
                Image(systemName: "square.grid.2x2.fill")
                Text("Activities")
            }
            .tag(0)
            
            NavigationView {
                CardioTrackerView()
            }
            .tabItem {
                Image(systemName: "chart.bar.fill")
                Text("Cardio")
            }
            .tag(1)
            
            NavigationView {
                LiftTrackerView()
            }
            .tabItem {
                Image(systemName: "person.crop.circle.fill")
                Text("Lift Activity")
            }
            .tag(2)
        }
        .accentColor(.purple)
    }
}

struct Homescreen_Previews: PreviewProvider {
    static var previews: some View {
        Homescreen()
    }
}
