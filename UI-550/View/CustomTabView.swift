//
//  CustomTabView.swift
//  UI-550
//
//  Created by nyannyan0328 on 2022/04/26.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var show : Bool
    @Binding var currentTab : String
    var body: some View {
        VStack{
            
            HStack{
                
                Button {
                    
                    withAnimation{
                        
                        show = true
                    }
                } label: {
                    
                    Image(systemName: "line.3.horizontal")
                        .font(.title)
                        .opacity(show ? 0 : 1)
                }
                Spacer()
                
                Image("p1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Capsule())

                
                
                
            }
            .padding()
            .padding(.top,getSafeAeaa().top)
            
            TabView(selection: $currentTab) {
                
                CompostitionalMain()
                   
                    .tag("Home")
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            
            
            
        }
        .maxHW()
        .overlay(alignment: .topLeading, content: {
            Button {
                
                withAnimation{
                    
                    show = false
                }
            } label: {
                
                Image(systemName: "xmark")
                    .font(.title)
                    .opacity(show ? 1 : 0)
            }
            .padding()
            
            
            
        })
        .background(.black)
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
