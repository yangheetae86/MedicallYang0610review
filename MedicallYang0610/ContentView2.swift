//
//  ContentView2.swift
//  MedicallYang0610
//
//  Created by HEE TAE YANG on 2020/06/10.
//  Copyright © 2020 yht. All rights reserved.
//

import SwiftUI

struct ContentView2: View {
    
    @State var showEditBtn = false // 통화목록버튼 누른후, true로 값이 바뀌고 hidden함수가 호출이 된다.
    
    var body: some View {
        
//        NavigationView {
            VStack {
                
                if self.showEditBtn {
                    Text("메디콜 공중전화1")
                } else {
                    Text("메디콜 공중전화1").hidden()
                }
                
                if self.showEditBtn {
                    Text("메디콜 공중전화2").hidden()
                } else {
                    Text("메디콜 공중전화2")
                }
                
                Button(action: {
                    self.showEditBtn = !self.showEditBtn // 변수가 Bool 형태일때 변수값을 반대로 만든다.
                }) {
                    Text("버튼1")
                }
            }
//        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
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
//)
// 네
