//
//  ImageModel.swift
//  UI-550
//
//  Created by nyannyan0328 on 2022/04/26.
//

import SwiftUI

struct ImageModel: Identifiable,Hashable,Codable {
    
    
    var id : String
    var download_url : String
  
    enum CordingKeys : String,CodingKey{
        
        case id
        case download_url
        
    }
  
}

