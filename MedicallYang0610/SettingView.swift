//
//  SettingView.swift
//  MedicallYang0610
//
//  Created by HEE TAE YANG on 2020/06/10.
//  Copyright © 2020 yht. All rights reserved.
//

import SwiftUI

struct SettingView: View {
    
    @Binding var goSetting : Bool
    
    var body: some View {
        
        NavigationView {
            GeometryReader {g in
                VStack {
                    ZStack {
                        Text("설정")
                            .background(Color("배경0").frame(width: g.size.width, height:g.size.height).edgesIgnoringSafeArea(.all))
                        HStack {
                            Button(action: {
                                self.goSetting = false
                            }) {
                                Spacer()
                                Text("취소")
                            }
                            Spacer()
                        }
                    }.padding()
                        .foregroundColor(.white)
                        .font(.headline)

                    List{
                        Text("약관 및 정책")
                        Text("회사 소개")
                        Text("자가 진단")
                        Text("버전 정보")
                    }
                    .font(.body)
                }
            }
        }
    }
}

//struct SettingView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingView()
//    }
//}

//.navigationBarTitle("설정", displayMode: .inline)

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(goSetting: ContentView.init(goSetting: false).$goSetting)
    }
}
