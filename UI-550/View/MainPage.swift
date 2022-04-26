//
//  MainPage.swift
//  UI-550
//
//  Created by nyannyan0328 on 2022/04/26.
//

import SwiftUI

struct MainPage: View {
    @State var currentTab : String = "Home"
    @State var show : Bool = false
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        ZStack{
            
            SlideView(currentTab: $currentTab)
            
            CustomTabView(show: $show, currentTab: $currentTab)
                .cornerRadius(show ? 30 : 0)
                .offset(x: show ? getRect().width / 2 : 0)
                .rotation3DEffect(.init(degrees: show ? -20 : 0), axis: (x: 0, y: 1, z: 0), anchor: .trailing)
                .ignoresSafeArea()
            
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
