//
//  SettingView.swift
//  MedicallYang0610
//
//  Created by HEE TAE YANG on 2020/06/10.
//  Copyright © 2020 yht. All rights reserved.
//

import SwiftUI

struct SettingView2: View {
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        
        NavigationView {
            GeometryReader {g in
                VStack(spacing: 0) {
                    ZStack {
                        Text("약관 및 정책")
                            .background(Color("배경0").frame(width: g.size.width, height:g.size.height).edgesIgnoringSafeArea(.all))
                        
                        HStack {
                            Button(action: {
                                self.presentation.wrappedValue.dismiss()//내 자신이 사라진다는 의미
                            }){
                                Image(systemName: "chevron.left")
                            }
                            Spacer()
                        }
                    }.padding()
                    .foregroundColor(.white)
                    .font(.headline)

                    List{
                        ListCell(title: "이용 약관")
                        ListCell(title: "개인정보 취급방침")
                        ListCell(title: "오픈소스 저작권")
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

//struct SettingView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingView()
//    }
//}

//.navigationBarTitle("설정", displayMode: .inline)

struct SettingView2_Previews: PreviewProvider {
    static var previews: some View {
        SettingView2()
    }
}
