//
//  MainView.swift
//  MedicallYang0610
//
//  Created by HEE TAE YANG on 2020/06/11.
//  Copyright © 2020 yht. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    @State var showTrash = false // @State 프로퍼티래퍼로 변수를 만들어 false 값 저장
    @Binding var goSetting: Bool // @Binding 프로퍼티래퍼로 변수를 만들어 Bool 타입 지정
    @State var index = 1 // @State 프로퍼티래퍼러 변수를 만들어 1 저장
    @State var offset : CGFloat = UIScreen.main.bounds.width // @State 프로퍼티래퍼로 변수를 만들어 CGFloat 타입으로 지정하고 UIScreen의 화면을 넓이를 구해서 저장.
    
    var width = UIScreen.main.bounds.width// UIScreen의 화면의 넓이를 구해서 width 변수에 저장
    
    var body: some View {
        VStack(spacing: 0) {//세로 스택 spacing: 0을 줌으로 간격이 없어진다. 주지않으면 간격이 생긴다
            
            HStack {// 가로 스택
                
                Text("메디콜 공중전화")// 앱 타이틀
                Spacer()// 공간주기
                //self.index의 값이 1일 때(홈버튼) 휴지통 아이콘을 감추고, 그렇지않을때(통화목록) 보이게 한다.
                if self.index == 1 {
                    Button(action: {
                    }){
                        Image(systemName: "trash").hidden()
                    }
                } else {
                    Image(systemName: "trash")
                }
                //설정창 버튼(gear)이 눌러지면 goSetting의 값에 true를 준다
                Button(action: {
                    self.goSetting = true
                }) {
                    Image(systemName: "gear")
                }
            }.padding()// 패딩은 swiftUI가 최적이라고 판단되는 레이아웃을 잡아주는 기능이다.
                .foregroundColor(.white)//컬러는 흰색
                .background(Color("배경0").edgesIgnoringSafeArea(.all))//배경색을 주었으며, 아이폰X부터 적용되는 엣지라인까지 영향을 주었다.
            
            AppBar(showTrash: self.$showTrash, index: self.$index, offset: self.$offset)
            
            GeometryReader { g in
                VStack {
                    HStack(spacing:0){
                        First()
                            .frame(width: g.frame(in: .global).width)//프레임의 좌표를 측정하여 뷰들이 보이도록하였다.
                        Scnd()
                            .frame(width: g.frame(in: .global).width)
                    }
                        .offset(x: self.offset)//x좌표에 offset을 준다
                        .padding(.trailing, self.width)//뷰가 보이도록 정렬
                        
                        .highPriorityGesture(// 제스처 액션을 주는 메서드
                            
                            DragGesture()
                                .onEnded({ value in
                                    if value.translation.width > 0{//넓이가 0보다 클때 changeView함수를 호출하여 false값을 준다
                                        print("right")
                                        self.changeView(left: false)
                                    }
                                    else {//넓이가 0보다 작을때 changeView함수를 호출하여 true값을 준다
                                        print("left")
                                        self.changeView(left: true)
                                    }
                                }))
                }
//                .animation(.default)//애니메이션효과
            }
        }
        
    }
    //제스처에 따른 뷰전환이 이루어지도록 만든 함수
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
        
        //        if left {// <- swipe
        //            if self.index == 1 {
        //                self.offset = self.width
        //                self.index = 1
        //            }
        //        }
        //        else {// -> swipe
        //            if self.index == 2 {
        //                self.offset = 0
        //                self.index = 2
        //            }
        //        }
        
        
    }
}

struct AppBar : View {
    
    @Binding var showTrash: Bool // showTrash가 호출 될 때 @State 프로퍼티에 대한 바이딩이다
    @Binding var index : Int // Int가 호출 될 때 @State 프로퍼티에 대한 바이딩이다
    @Binding var offset : CGFloat // CGFloat가 호출 될 때 @State 프로퍼티에 대한 바이딩이다
    
    var width = UIScreen.main.bounds.width //UIScreen의 화면의 넓이를 구해서 width 변수에 저장
    
    var body: some View {
        
        VStack {// 세로 스택
            HStack {// 가로 스택
                //홈 버튼이 눌러지면 index 값에 1을 주고, offset값에 현재 화면의 넓이를 구한다. showTrash에 false를 준다
                Button(action: {
                    
                    self.index = 1
                    self.offset = self.width
                    self.showTrash = false
                    
                }) {
                    VStack(spacing: 8) {//세로 스택간의 간격을 8 주었다
                        Text("홈")
                            //index==1 즉 홈 버튼이 눌러졌을 때 화이트 컬러로, 그렇지 않을때(index!=1) 투명도를 준다.
                            .foregroundColor(self.index == 1 ? .white : Color.white.opacity(0.6))
                        Capsule()
                            //위와 마찬가지로 옐로우컬러를 주고, 그렇지 않을때 표시되지않는다.
                            .fill(self.index == 1 ? .yellow : Color.clear)
                            .frame(height: 4)//프레임 크기이다.
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
            .background(Color("배경0"))//백그라운드에 색상을 주었다.
    }
}

struct First : View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {//스크롤뷰
            GeometryReader { g in//프레임의 좌표를 측정할때 사용한다
                
                VStack {
                    ZStack {// 겹치는 스택이다
                        Color("배경0").frame(height: g.size.width/1.5)//컬러가 차지하는 프레임의 좌표를 측정하여 사이즈의 크기를 조절 하였다.
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
                                .frame(width: 325, height: g.size.width/5)//프레임을 주어 사이즈를 조절.
                                .multilineTextAlignment(.center)
                        }
                        .background(Color.white)
                        .border(Color.gray.opacity(0.5))
                        
                        VStack{
                            // ListCellMainV 라는 구조체를 호출하여 요구하는 파라미터의 타입에 맞게 전달값을 주어야 사용할 수 있다.
                            ListCellMainV(image: "wifi", title: "WiFi, LTE 중 1가지만 선택해주세요", content: "동시에 WiFi / LTE 데이터 연결 시\n스마트 영상통화가 안될 수 있습니다.")
                            ListCellMainV(image: "phone.circle.fill", title: "영상, 음성통화가 안되세요?", content: "앱을 종료 후 재 실행해 주세요.")
                            ListCellMainV(image: "headphones", title: "기타 오류 발생 시", content: "02-501-3946 로 문의해주세요.")
                        }
                    }.padding(.top, -30.0) // -값을 주어, 배경에 겹치도록 한다.
                }
            }
        }.background(Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all))//하위부분색상
    }
}

struct Scnd : View {
    var body: some View {
        // 리스트를 사용하였고 이미지와 텍스트를 만들고 스택정렬을 사용하였다.
        List {
            HStack {
                Image(systemName: "phone.fill")
                    .foregroundColor(.blue)
                Text("테스트")
                    .font(.headline)
                Text("영상통화")
                    .font(.body)
                Spacer()
                VStack(alignment: .trailing) {// 우측정렬이다
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
