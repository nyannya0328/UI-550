//
//  ContentView.swift
//  UI-550
//
//  Created by nyannyan0328 on 2022/04/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       MainPage()
            .preferredColorScheme(.dark)
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View{
    
    func getRect()->CGRect{
        
        
        return UIScreen.main.bounds
    }
    
    func lLeading()->some View{
        
        self
            .frame(maxWidth:.infinity,alignment: .leading)
    }
    func lTreading()->some View{
        
        self
            .frame(maxWidth:.infinity,alignment: .trailing)
    }
    func lCenter()->some View{
        
        self
            .frame(maxWidth:.infinity,alignment: .center)
    }
    
    func maxHW()->some View{
        
        self
            .frame(maxWidth:.infinity,maxHeight: .infinity)
        
    
    }

 func maxTop() -> some View{
        
        
        self
            .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .top)
            
    }
    
    func getSafeAeaa()->UIEdgeInsets{
        
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {return .zero}
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else{
            return .zero
        }
        
        return safeArea
    }
}
