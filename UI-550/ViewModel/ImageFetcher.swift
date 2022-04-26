//
//  ImageFetcher.swift
//  UI-550
//
//  Created by nyannyan0328 on 2022/04/26.
//

import SwiftUI

class ImageFetcher: ObservableObject {
   
    @Published var fetchImages : [ImageModel]?
    
    @Published var currentPage : Int = 0
    
    @Published var startPagenation : Bool = false
    @Published var endPagenation : Bool = false
    
    
    init() {
        
      UpdateImages()
    }
    
    func UpdateImages(){
        
        currentPage += 1
        
        Task{
            
            do{
                
              try await fetchImages()
                
            }
            catch{}
        }
    }
    
    func fetchImages()async throws{
        
        guard let url = URL(string: "https://picsum.photos/v2/list?Page=\(currentPage)&limit=30") else{return}
        let responce = try await URLSession.shared.data(from: url)
        
        let images = try JSONDecoder().decode([ImageModel].self, from: responce.0).compactMap { item -> ImageModel? in
            
            
            let imageID = item.id
            let sizedURL =  "https://picsum.photos/id/\(imageID)/1000/1000"
            
            return .init(id: imageID, download_url: sizedURL)
        }
        
        await MainActor.run(body: {
            
            
            if fetchImages == nil{fetchImages = []}
            fetchImages?.append(contentsOf: images)
            endPagenation = (fetchImages?.count ?? 0) > 100
            startPagenation = false
        })
        
        
    }
}
