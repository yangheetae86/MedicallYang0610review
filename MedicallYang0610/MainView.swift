//
//  MainView.swift
//  MedicallYang0610
//
//  Created by HEE TAE YANG on 2020/06/11.
//  Copyright © 2020 yht. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    @Binding var goSetting: Bool
    @State var index = 1
    @State var offset : CGFloat = UIScreen.main.bounds.width
    
    var width = UIScreen.main.bounds.width
    
    var body: some View {
        VStack(spacing: 0) {//spacing: 0을 줌으로 간격이 없어진다
            
            HStack {
                Text("메디콜 공중전화")
                Spacer()
                Button(action: {
                    
                }) {
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
            
            AppBar(index: self.$index, offset: self.$offset)
            
            GeometryReader { g in
                
                HStack(spacing: 0){
                    First()
                        .frame(width: g.frame(in: .global).width)
                    Scnd()
                        .frame(width: g.frame(in: .global).width)
                }
                .offset(x: self.offset)
                .padding(.trailing, self.width)
                .padding(.top)
                    
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
        .animation(.default)
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
    
    @Binding var index : Int
    @Binding var offset : CGFloat
    
    var width = UIScreen.main.bounds.width
    
    var body: some View {
        
        VStack {
            HStack {
                Button(action: {
                    
                    self.index = 1
                    self.offset = self.width
                    
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
            Image("imgSmartphone")
        }
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
    }
}
