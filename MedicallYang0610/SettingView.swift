//
//  SettingView.swift
//  MedicallYang0610
//
//  Created by HEE TAE YANG on 2020/06/10.
//  Copyright © 2020 yht. All rights reserved.
//

//설정화면을 보여주는 곳이다.
import SwiftUI

struct SettingView: View {
    @State var showAlert = false //@State 프로퍼티래퍼로 false값을 주었다. 알림기능의 상태를 저장할 것이다.
    @Binding var goSetting : Bool //@Binding 프로퍼티래퍼로 변수를 만들어 Bool 타입 지정
    
    var body: some View {
        //네비게이션뷰를 사용한 이유는 리스트안에서 만든 목록을 클릭했을 때, 그 다음의 뷰로 넘어가게 하기 위함이다.
        NavigationView {
            GeometryReader {g in//프레임의 좌표를 읽는 기능
                VStack(spacing:0) {//간격을 0
                    ZStack {//겹치는 스택을 사용하여 설정 타이틀과 취소 버튼을 만들었다.
                        Text("설정")
                            //상단의 배경색을 만들기위해 프레임의 사이즈를 조절
                            .background(Color("배경0").frame(width: g.size.width, height:g.size.height).edgesIgnoringSafeArea(.all))
                        HStack {
                            Button(action: {
                                self.goSetting=false
                            }) {
                                Spacer()//취소버튼의 위치를 바꿔줌
                                Text("취소")
//                                Spacer()
                            }
                            Spacer()//간격조절
                        }
                    }.padding()
                        .foregroundColor(.white)//타이틀의 색
                        .font(.headline)//타이틀의 폰트
                    //리스트를 만들고 리스트에 들어갈 항목을 만들어 선택하면 다음뷰로 전환이 되도록 하였다.
                    List {
                        NavigationLink(destination:
                            SettingView2()// SettingView2 구조체로 전환된다.
                                .navigationBarTitle("")//NavigationLink를 생성했을때 자동으로 만들어지는 navigationBarTitle속성을 사용하지 않기위해서 필요한 수정자(modifier)들이다.
                                .navigationBarHidden(true)) {
                                    ListCell(title: "약관 및 정책")//목록들의 높이 간격을 똑같이 맞추기 위해 ListCell이라는 구조체를 가져와서 타이틀 파라미터의 값만 입력하였다. 리스트항목이 많아지면 반복되는 코드를 줄일 수 있다.
                        }
                        NavigationLink(destination:
                            IntroCompany()// IntroCompany 구조체로 전환된다.
                                .navigationBarTitle("")
                                .navigationBarHidden(true)) {
                                    ListCell(title: "회사 소개")
                        }
                        NavigationLink(destination:
                            SelfCheck()//SelfCheck 구조체로 전환된다.
                                .navigationBarTitle("")
                                .navigationBarHidden(true)) {
                                    ListCell(title: "자가 진단")
                        }
                        Button(action: {//팝업(알림)이 보이는 버튼
                            self.showAlert=true//버튼이 눌러지면 showAlert 프로퍼티의 false값이 true가 된다.
                        }){
                            ListCell(title: "버전 정보")
                        }
                        .alert(isPresented: self.$showAlert){//showAlert의 상태변화로 인해 아래의 Alert가 호출된다.
                            Alert(title: Text("버전정보"), message: Text("최신 버전입니다"))
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
