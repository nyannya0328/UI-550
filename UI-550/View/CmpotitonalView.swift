//
//  CmpotitonalView.swift
//  UI-550
//
//  Created by nyannyan0328 on 2022/04/26.
//

import SwiftUI

struct CmpotitonalView<Content,Item,ID>: View where Content : View,ID : Hashable,Item:RandomAccessCollection,Item.Element : Hashable{
    
    var content : (Item.Element) -> Content
    var items : Item
    var id : KeyPath<Item.Element,ID>
    var spacing : CGFloat

    init(items : Item,id:KeyPath<Item.Element,ID>,spacing : CGFloat = 5,@ViewBuilder content : @escaping(Item.Element) -> Content) {
        
        self.content = content
        self.id = id
        self.spacing = spacing
        self.items = items
    }
    
    var body: some View {
        LazyVStack(spacing:spacing){
            
            
            ForEach(genearateColumns(),id:\.self){row in
                
                RowView(row: row)
                

            }
            
            
            
        }
    }
    @ViewBuilder
    func safeView(row : [Item.Element],index : Int)-> some View{
        
        
        if (row.count - 1) >= index{
            
            content(row[index])
        }
        
        
    }
    @ViewBuilder
    func RowView(row : [Item.Element]) -> some View{
        
        GeometryReader{proxy in
            
            let widht = proxy.size.width
            let height = (proxy.size.height - spacing) / 2
            
            let type = layoutType(row: row)
            
            let columnsWidth = (widht > 0  ? ((widht - (spacing * 2)) / 3) : 0)
            
            
            HStack(spacing:spacing){
                
                
                if type == .type1{
                    
                    safeView(row: row, index: 0)
                    
                    VStack{
                        
                        
                        safeView(row: row, index: 1)
                            .frame(height: height)
                        
                        
                        safeView(row: row, index: 2)
                            .frame(height: height)
                        
                        
                        
                    }
                    .frame(width: columnsWidth)
                    
                    
                    
                }
                
                if type == .type2{
                    
                    
                    HStack(spacing:spacing){
                        
                        safeView(row: row, index: 0)
                            .frame(width: columnsWidth)
                        
                        safeView(row: row, index: 1)
                            .frame(width: columnsWidth)
                        
                        safeView(row: row, index: 2)
                            .frame(width: columnsWidth)
                        
                        
                        
                    }
                }
                
                if type == .type3{
                    
                    
                    VStack(spacing:spacing){
                        
                        
                        safeView(row: row, index: 0)
                            .frame(height: height)
                        
                        safeView(row: row, index: 1)
                            .frame(height: height)
                        
                    }
                    .frame(width: columnsWidth)
                    
                    safeView(row: row, index: 2)
                }
                
            
                
                
            }
        }
        .frame(height: layoutType(row: row) == .type1 || layoutType(row: row) == .type3 ? 250 : 120)
                     
        
        
    }
    
    func layoutType(row : [Item.Element]) -> LayoutType{
        
        
        let index = genearateColumns().firstIndex { item in
            
            return item == row
        } ?? 0
        
        var types : [LayoutType] = []
        
        genearateColumns().forEach { _ in
            
            
            if types.isEmpty{
                
                types.append(.type1)
            }
            else if types.last == .type1{
                
                types.append(.type2)
            }
            
            else if types.last == .type2{
                
                types.append(.type3)
            }
            
            else if types.last == .type3{
                
                types.append(.type1)
            }
            else{}
            
            
            
        }
        
        return types[index]
        
    }
    func genearateColumns()->[[Item.Element]]{
        
        var columns : [[Item.Element]] = []
        var row : [Item.Element] = []
        
        for item in items{
            
            if row.count == 3{
                columns.append(row)
                row.removeAll()
                row.append(item)
            }
            else{
                
                row.append(item)
                
            }
        }
        
        columns.append(row)
        row.removeAll()
        return columns
    }
}

struct CmpotitonalView_Previews: PreviewProvider {
    static var previews: some View {
        CompostitionalMain()
    }
}

enum LayoutType{
    
    case type1
    case type2
    case type3
}
