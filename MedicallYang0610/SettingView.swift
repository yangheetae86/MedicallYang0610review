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
                VStack (spacing:0){
                    ZStack {
                        Text("설정")
                            .background(Color("배경0").frame(width: g.size.width, height:g.size.height).edgesIgnoringSafeArea(.all))
                        HStack {
                            Button(action: {
                                self.goSetting=false
                            }) {
                                Spacer()
                                Text("취소")
                            }
                            Spacer()
                        }
                    }.padding()
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    List {
                        NavigationLink(destination:
                            SettingView2()
                                .navigationBarTitle("")
                                .navigationBarHidden(true)) {
                                    ListCell(title: "약관 및 정책")
                        }
                        NavigationLink(destination:
                            IntroCompany()
                                .navigationBarTitle("")
                                .navigationBarHidden(true)) {
                                    ListCell(title: "회사 소개")
                        }
                        NavigationLink(destination:
                            SelfCheck()
                                .navigationBarTitle("")
                                .navigationBarHidden(true)) {
                                    ListCell(title: "자가 진단")
                        }
                    }
                    
                }
            }.navigationBarTitle("")
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

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(goSetting: ContentView.init(goSetting: false).$goSetting)
    }
}
