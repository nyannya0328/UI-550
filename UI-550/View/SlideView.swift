//
//  SlideView.swift
//  UI-550
//
//  Created by nyannyan0328 on 2022/04/26.
//

import SwiftUI

struct SlideView: View {
    @Binding var currentTab : String
    
    @Namespace var animation
    
    var body: some View {
        VStack{
            
            
            HStack(spacing:15){
                
                
                
                Text("Girls")
                    .font(.title.weight(.medium))
                
                Image("p1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Capsule())
            }
            .padding(.leading)
            .lLeading()
            
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    TabCardView(icon: "theatermasks.fill", title: "Home")
                    
                    
                    TabCardView(icon: "safari.fill", title: "Discover")
                    
                    TabCardView(icon: "applewatch", title: "Devices")
                    
                    TabCardView(icon: "person.fill", title: "Profile")
                    
                    TabCardView(icon: "gearshape.fill", title: "Settings")
                    
                    TabCardView(icon: "info.circle.fill", title: "About")
                    
                    TabCardView(icon: "questionmark.circle.fill", title: "Help")
                    
                    Spacer()
                    
                    TabCardView(icon: "rectangle.portrait.and.arrow.right", title: "Log Out")
                    
                    
                }
                .padding()
                .padding(.top,10)
            }
            .frame(width: getRect().width / 2, alignment: .leading)
            .lLeading()
            
            
            
            
            
        }
        .maxHW()
        .background(Color("BG"))
        
        
    }
    @ViewBuilder
    func TabCardView(icon : String,title : String) -> some View{
        
        
        Button {
            
            if title == "Log Out"{}
            
            else{
                
                withAnimation{
                    
                    currentTab = title
                }
            }
            
        } label: {
            
            HStack{
                
                
                Image(systemName: icon)
                    .frame(width: currentTab == title ? 50 : nil, height: 50)
                    .foregroundColor(currentTab == title ? Color("Purple") : title == "Log Out" ? Color("Orange") : .white)
                    .background{
                        
                        if currentTab == title{
                            
                            Color.white.clipShape(Capsule())
                                .matchedGeometryEffect(id: "TABCIRCLE", in: animation)
                        }
                    }
                
                Text(title)
                    .font(.caption.weight(.semibold))
                    .frame(width: 60)
                    .foregroundColor(title == "Log Out" ? Color("Orange") : .white)
                
                
            }
            .contentShape(Rectangle())
            .background{
                
                if currentTab == title{
                    
                    Color("Purple").clipShape(Capsule())
                    
                        .matchedGeometryEffect(id: "TABANIMATION", in: animation)
                }
                
            }
            .offset(x: currentTab == title ? 15 : 0)
        }
        
        
        
        
    }
}

struct SlideView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
