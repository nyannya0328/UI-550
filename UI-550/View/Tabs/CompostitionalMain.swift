//
//  CompostitionalMain.swift
//  UI-550
//
//  Created by nyannyan0328 on 2022/04/26.
//

import SwiftUI
import SDWebImageSwiftUI

struct CompostitionalMain: View {
    @StateObject var model : ImageFetcher = .init()
    var body: some View {
        NavigationView{
            
            Group{
                
                
                    
                    if let images = model.fetchImages{
                        
                        ScrollView(.vertical, showsIndicators: false) {
                        
                        VStack{
                            
                            CmpotitonalView(items: images,id:\.self) { item in
                                
                             
                                
                                GeometryReader{proxy in
                                    
                                    let size = proxy.size
                                    
                                    WebImage(url: URL(string: item.download_url))
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: size.width, height: size.height)
                                        .cornerRadius(20)
                                        .onAppear {
                                            
                                            if images.last?.id == item.id{
                                                
                                                model.startPagenation = true
                                            }
                                        }
                                }
                             
                                
                            }
                        }
                        .padding()
                        .padding(.bottom)
                        
                        
                        if model.startPagenation && !model.endPagenation{
                            
                            ProgressView()
                                .onAppear {
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                                        
                                        
                                        model.UpdateImages()
                                    }
                                }
                            
                        }
                        
                        
                    
                    else{
                        
                        ProgressView()
                    }
                
                    }
                        .navigationTitle("Comotitional View")
                    }
               
            
            }
            
            
        }
    }
}

struct CompostitionalMain_Previews: PreviewProvider {
    static var previews: some View {
        CompostitionalMain()
    }
}
