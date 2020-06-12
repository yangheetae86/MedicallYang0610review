//
//  SelfCheck.swift
//  MedicallYang0610
//
//  Created by HEE TAE YANG on 2020/06/12.
//  Copyright © 2020 yht. All rights reserved.
//

import SwiftUI

struct SelfCheck: View {
    @Environment(\.presentationMode) var presentation
    @State private var onOff0 = false
    @State private var onOff1 = false
    @State private var onOff2 = false

    
    var body: some View {
        
        NavigationView {
            GeometryReader {g in
                VStack(spacing: 0) {
                    ZStack {
                        Text("자가 진단")
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
                        Section(header: Text("일반 자가진단")
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .padding(.top)
                            .frame(height: 50)){
                                Group{
                                    HStack {
                                        Text("네트워크 연결 상태")
                                        Spacer()
                                        Text("wifi 연결 중")
                                            .foregroundColor(.gray)
                                    }
                                    HStack {
                                        Text("푸쉬 알림 허용 상태")
                                        Spacer()
                                        Toggle("", isOn: self.$onOff0)
                                    }
                                    HStack {
                                        Text("카메라 접근 허용 상태")
                                        Spacer()
                                        Toggle("", isOn: self.$onOff1)
                                    }
                                    HStack {
                                        Text("마이크 접근 허용 상태")
                                        Spacer()
                                        Toggle("", isOn: self.$onOff2)
                                    }
                                    }
                                    .frame(height: 50)
                                    .font(.subheadline)
                        }
                        Section(header: Text("통화 자가진단")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .padding(.top)
                            .frame(height: 50)){
                                Group {
                                    HStack {
                                        Text("푸쉬 테스트")
                                        Spacer()
                                        Text("시작")
                                            .frame(width: 70.0, height: 32.0).background(Color("배경0")).cornerRadius(7)
                                    }
                                    HStack {
                                        Text("통화서버 연결 테스트")
                                        Spacer()
                                        Text("시작")
                                            .frame(width: 70.0, height: 32.0).background(Color("배경0")).cornerRadius(7)
                                    }
                                }
                        }
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct SelfCheck_Previews: PreviewProvider {
    static var previews: some View {
        SelfCheck()
    }
}
