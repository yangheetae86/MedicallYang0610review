//
//  SettingView.swift
//  MedicallYang0610
//
//  Created by HEE TAE YANG on 2020/06/10.
//  Copyright © 2020 yht. All rights reserved.
//

import SwiftUI

struct SettingView2: View {
    @Environment(\.presentationMode) var presentation //스스로 상태 변화를 감지는 @Environment 라는 프로퍼티래퍼를 사용하였다
    
    var body: some View {
        //네비게이션뷰를 사용하여 각 항목별로 선택 클릭 되었을 때 전환되는 뷰를 다르게 만듬
        NavigationView {
            GeometryReader {g in
                VStack(spacing: 0) {
                    ZStack {
                        Text("약관 및 정책")
                            //frame임의 값을 수동으로 숫자를 주지않고 GeometryReader 사영하여 전체영역의 좌표값으로 사이즈를 주는 이유는 눈대중으로 줄경우 아이폰 디바이스별로 다른 화면을 표시하기 때문에 모든 디바이스가 공통된 사이즈를 보여주기 위함이다.
                            .background(Color("배경0").frame(width: g.size.width, height:g.size.height).edgesIgnoringSafeArea(.all))
                        
                        HStack {
                            Button(action: {
                                self.presentation.wrappedValue.dismiss()//내 자신이 사라진다는 의미. 버튼이 눌러졌을 때 이 SettingView2는 닫혀 진다.
                            }){
                                Image(systemName: "chevron.left")
                            }
                            Spacer()//chevron.left 이미지를 좌측에 보내기 위함
                        }
                    }.padding()
                    .foregroundColor(.white)
                    .font(.headline)
                    //리스트로 묶고 네비게이션링크를 달았다. 각 항목별로 뷰 전환시 보여지는 뷰가 다르게 하였다. 이용약관과 개인정보 취급방침은 웹url이 있으므로 false 값을 주었고, 오픈소스 저작권은 없기 때문에 true를 주었다.
                    List{
                        NavigationLink(destination:
                            TopOfWebViews(urlOrFile: false, url_top: "https://smartmobile.gbphone.co.kr:1004/hospitalterms/mobileagreement", title_top: "이용 약관")
                                .navigationBarTitle("")
                                .navigationBarHidden(true)) {
                                    ListCell(title: "이용 약관")
                        }
                        NavigationLink(destination:
                            TopOfWebViews(urlOrFile: false, url_top: "https://smartmobile.gbphone.co.kr:1004/hospitalterms/mobileprivateinfo_ios", title_top: "개인정보 취급방침")
                                .navigationBarTitle("")
                                .navigationBarHidden(true)) {
                                    ListCell(title: "개인정보 취급방침")
                        }
                        NavigationLink(destination:
                            TopOfWebViews(urlOrFile: true, url_top: "", title_top: "오픈소스 저작권")
                                .navigationBarTitle("")
                                .navigationBarHidden(true)){
                                    ListCell(title: "오픈소스 저작권")
                        }
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
