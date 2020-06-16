//
//  MainView.swift
//  MedicallYang0610
//
//  Created by HEE TAE YANG on 2020/06/11.
//  Copyright © 2020 yht. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    @State var showTrash = false
    @Binding var goSetting: Bool
    @State var index = 1
    @State var offset : CGFloat = UIScreen.main.bounds.width
    
    var width = UIScreen.main.bounds.width
    
    var body: some View {
        VStack(spacing: 0) {//spacing: 0을 줌으로 간격이 없어진다
            
            HStack {
                
                Text("메디콜 공중전화")
                Spacer()
                if self.index == 1 {
                    Button(action: {
                    }){ Image(systemName: "trash").hidden()
                    }
                } else {
                    Image(systemName: "trash")
                }
                Button(action: {
                    self.goSetting = true
                }) {
                    Image(systemName: "gear")
                }
            }.padding()
            .foregroundColor(.white)
            .background(Color("배경0").edgesIgnoringSafeArea(.all))
            
            AppBar(showTrash: self.$showTrash, index: self.$index, offset: self.$offset)
            
            GeometryReader { g in
                VStack {
                    HStack(spacing:0){
    //                    GeometryReader { g in
                        First()
                            .frame(width: g.frame(in: .global).width)
                        Scnd()
                            .frame(width: g.frame(in: .global).width)
                    }
                    .offset(x: self.offset)
                    .padding(.trailing, self.width)
                        
                    .highPriorityGesture(
                        
                        DragGesture()
                            .onEnded({ value in
                                if value.translation.width > 0 {
                                    print("right")
                                    self.changeView(left: false)
                                }
                                else {
                                    print("left")
                                    self.changeView(left: true)
                                }
                        }))
                }
            }
        }
//        .animation(.default)
    }
    
    func changeView(left: Bool){
        if left {// <- swipe
            if self.index == 1 {
                self.offset = 0
                self.index = 2
            }
        }
        else {// -> swipe
            if self.index == 2 {
                self.offset = self.width
                self.index = 1
            }
        }
    }
}

struct AppBar : View {
    
    @Binding var showTrash: Bool
    @Binding var index : Int
    @Binding var offset : CGFloat
    
    var width = UIScreen.main.bounds.width
    
    var body: some View {
        
        VStack {
            HStack {
                
//                if self.index == 1 {
//                    Image(systemName: "trash")
//                } else {
//                    Image(systemName: "trash").hidden()
//                }
//
//                if self.index == 2 {
//                    Image(systemName: "trash").hidden()
//                } else {
//                    Image(systemName: "trash")
//                }
                
                Button(action: {
                    
                    self.index = 1
                    self.offset = self.width
                    self.showTrash = false
                    
                }) {
                    VStack(spacing: 8) {
                        Text("홈")
                            .foregroundColor(self.index == 1 ? .white : Color.white.opacity(0.6))
                        Capsule()
                            .fill(self.index == 1 ? .yellow : Color.clear)
                            .frame(height: 4)
                    }
                }
                
                Button(action: {
                    
                    self.index = 2
                    self.offset = 0
                    self.showTrash = true
                    
                }) {
                    VStack(spacing: 8) {
                        Text("통화목록")
                            .foregroundColor(self.index == 2 ? .white : Color.white.opacity(0.6))
                        Capsule()
                            .fill(self.index == 2 ? .yellow : Color.clear)
                            .frame(height: 4)
                    }
                }
            }
        }
        .background(Color("배경0"))
    }
}

struct First : View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            GeometryReader { g in
                
                VStack {
                    ZStack {
                        Color("배경0").frame(height: g.size.width/2)
                        Image("imgSmartphone")
                    }
                    
                    VStack {
                        VStack {
                            Text("수신전용 전화서비스 App")
                                .padding(.top)
                                .font(.headline)
                                .foregroundColor(Color(red: 26/255, green: 107/255, blue: 158/255))//rgb색상
                            
                            Text("스마트 공중전화가 설치되어 있는 병원에 계신분과\n 앱을 통해 통화가능한 스마트 앱입니다.")
                                .foregroundColor(.gray)
                                .font(.footnote)
                                .frame(width: 325, height: g.size.width/5)
                                .multilineTextAlignment(.center)
                        }
                        .background(Color.white)
                        .border(Color.gray)
                        
                        VStack{
                            ListCellMainV(image: "wifi", title: "WiFi, LTE 중 1가지만 선택해주세요", content: "동시에 WiFi / LTE 데이터 연결 시\n스마트 영상통화가 안될 수 있습니다.")
                            ListCellMainV(image: "phone.circle.fill", title: "영상, 음성통화가 안되세요?", content: "앱을 종료 후 재 실행해 주세요.")
                            ListCellMainV(image: "headphones", title: "기타 오류 발생 시", content: "02-501-3946 로 문의해주세요.")
                        }
                    }.padding(.top, -30)
                }
            }
        }.background(Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all))
    }
}

struct Scnd : View {
    var body: some View {
        List {
            HStack {
                Image(systemName: "phone.fill")
                    .foregroundColor(.blue)
                Text("테스트")
                    .font(.headline)
                Text("영상통화")
                    .font(.body)
                Spacer()
                VStack(alignment: .trailing) {
                    Text("6월 11일 오전 11:59")
                    Text("00:00:34")
                }
                .font(.callout)
                .foregroundColor(.gray)
            }
            HStack {
                Image(systemName: "phone.fill")
                    .foregroundColor(.blue)
                Text("테스트")
                    .font(.headline)
                Text("영상통화")
                    .font(.body)
                Spacer()
                VStack(alignment: .trailing) {
                    Text("6월 11일 오전 11:59")
                    Text("00:00:34")
                }
                .font(.callout)
                .foregroundColor(.gray)
            }
        }
    }
}


struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        return MainView(goSetting: ContentView.init(goSetting: false).$goSetting)
//        return First()
    }
}
