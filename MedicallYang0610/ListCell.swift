//
//  ListCell.swift
//  MedicallYang0610
//
//  Created by HEE TAE YANG on 2020/06/12.
//  Copyright © 2020 yht. All rights reserved.
//

import SwiftUI

struct ListCell:View {
    
    var title : String
    
    var body: some View {
        
        HStack {
            Text(title)
                .frame(height: 60)
        }
    }
}

struct ListCell_Previews: PreviewProvider {
    static var previews: some View {
        ListCell(title: "ss")
    }
}
