//
//  ContentView.swift
//  MedicallYang0610
//
//  Created by HEE TAE YANG on 2020/06/10.
//  Copyright © 2020 yht. All rights reserved.
//
/* */


import SwiftUI

struct ContentView: View {
    
    @State var goSetting : Bool = false // @State 프로퍼티 래퍼는 스트럭트문과 바디문 사이에 넣는다
    var body: some View {
        VStack {
            if goSetting { //if 문을 사용하여 설정버튼을 눌렀을 때 SettingView 가 보여지고, 그렇지않을때는 MainView 가 보여진다.
                SettingView(goSetting: $goSetting)
            } else {
                MainView(goSetting: $goSetting)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        Group {
            ContentView()
//                .previewDevice(PreviewDevice(rawValue: "iPhone 8")) //디바이스를 여러개로 표시하는 방법
//            ContentView()
//                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
//        }
    }
}






/*
 메디콜 개발 시 참고하세요
 
 1. 메인 화면 ContentView 를 두 벌로 구성
 var body: some View {
    VStack {
        if viewRouter.currentPage == "page1" {
            ContentViewA()
        } else if viewRouter.currentPage == "page2" {
            ContentViewB()
                .transition(.scale)//화면 전환 시 효과
        }
    }
 }
 
 2. 네비게이션 뷰 trailing 아이템 액션을 이용, 버튼 클릭 시
 @EnvironmentObject var viewRouter: ViewRouter
 변경하여 노출될 페이지 전환
 
 3. 두번째 페이지도 네비게이션 스타일로 구성하여 리스트 생성, 세번째 페이지 연결
 */

//.navigationBarTitle(
//    Text("Ev Cars")
//        .foregroundColor(.white).font(.title),displayMode: .inline

// 리스트의 항목을 사용자가 터치하면 앱의 다른화면으로 이동해야 할 경우가 있다.
// 이 경우 네비게이션뷰 또는 네비게이션링크를 사용하여 구현한다.
