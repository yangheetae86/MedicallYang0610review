//
//  ListCellMainV.swift
//  MedicallYang0610
//
//  Created by HEE TAE YANG on 2020/06/15.
//  Copyright © 2020 yht. All rights reserved.
//

import SwiftUI

struct ListCellMainV: View {
    
    var image: String
    var title: String
    var content: String
    
    var body: some View {
        
        HStack(spacing:0) {
            Image(systemName: image)
                .background(Color("배경0").frame(width: 50, height: 80))
                .foregroundColor(.white)
                .frame(width: 50, height: 80)
                .aspectRatio(contentMode: .fill)
                .font(.headline)
            
            VStack {
                Text(title)
                    .padding(.leading)
                    .frame(minWidth: 0, maxWidth: 275, minHeight: 30, maxHeight: 30, alignment: .leading)
                Text(content)
                    .padding(.leading)
                    .frame(minWidth: 0, maxWidth: 275, minHeight: 30, maxHeight: 45, alignment: .leading)
                    .foregroundColor(.blue)
            }
            .font(.footnote)
            .background(Color.white)
        }
        .border(Color(.gray))
    }
}

struct ListCellMainV_Previews: PreviewProvider {
    static var previews: some View {
        ListCellMainV(image: "wifi", title: "A B C", content: "가나다러더머머더더")
    }
}
