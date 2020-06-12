//
//  IntroCompany.swift
//  MedicallYang0610
//
//  Created by HEE TAE YANG on 2020/06/12.
//  Copyright © 2020 yht. All rights reserved.
//

import SwiftUI

struct IntroCompany: View {
    @Environment(\.presentationMode) var presentation : Binding<PresentationMode>
    
    var body: some View {
        
        NavigationView {
            GeometryReader {g in
                VStack(spacing: 0) {
                    ZStack {
                        Text("회사 소개")
                            .background(Color("배경0").frame(width: g.size.width, height: g.size.height/6).edgesIgnoringSafeArea(.all))
                        
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
                    ZStack {
                        VStack {
                            Spacer()
                            HStack {
                                Image("gb_background")
                                Spacer()
                            }
                        }
                    
                        VStack {
                            Image("imgLogo")
                            Image("imgTypo")
                            Image("imgGraph")
                        }
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct IntroCompany_Previews: PreviewProvider {
    static var previews: some View {
        IntroCompany()
    }
}

//ZStack {
//    VStack {
//        Spacer()
//        HStack {
//            Image("gb_background")
//            Spacer()
//        }
//    }
//
//    VStack {
//        Image("imgLogo")
//        Image("imgTypo")
//        Image("imgGraph")
//    }
//}
