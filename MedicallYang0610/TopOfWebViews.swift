//
//  TopOfWebViews.swift
//  MedicallYang0610
//
//  Created by HEE TAE YANG on 2020/06/16.
//  Copyright © 2020 yht. All rights reserved.
//

import SwiftUI
import Foundation
import WebKit // 웹뷰를 불러와 쓰는 기능을 사용하기 위해서 임포트를 해주어야 한다.


struct TopOfWebViews: View {
    @Environment(\.presentationMode) var presentation //스스로 상태 변화를 감지는 @Environment 라는 프로퍼티래퍼를 사용하였다
    
    var urlOrFile : Bool//true 일때 file, false 일때 url
    var url_top : String
    var title_top : String
    
    var body: some View {
        
        NavigationView {
            GeometryReader {g in
                VStack(spacing: 0) {
                    ZStack {
                        Text(self.title_top)
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
                     // 이용약관이나 회사정책들은 수시로 변할수가 있는것 때문에 업데이트가 필요할수 도 있다. 그런데 만약 웹싸이트에서만 정책을 불러온다고하면 그 불러오는 시간이 미세하게나마 걸릴수가있고 회사서버의 문제에따라서는 로딩이 안될수도 있다. 또 html파일만으로 로드한다고 했을 때는 업데이트내역을 수정할수가없다. 때문에 웹url에서 정책을 불러오기전에 html파일을 먼저 보여주는 if문을 작성한다.
                    if self.urlOrFile {
                        ZStack {
                            Color(.white)
                            WkwebView() // html파일을 불러오는 구조체
                        }
                    } else {
                        WebViews(url_webview: self.url_top) // 웹url을 불러오는 구조체
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct WebViews: UIViewRepresentable { //웹url을 불러오는 구조체
    var url_webview: String
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.url_webview) else {
            return WKWebView()
        }
        
        let request = URLRequest(url: url)
        let wkWebView = WKWebView()
        wkWebView.load(request)
        return wkWebView
    }
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebViews>) {
        
    }
}

struct WkwebView: UIViewRepresentable { //html형식의 파일을 불러오는 구조체
    func makeUIView(context: Context) -> WKWebView {
        let wconfiguration = WKWebViewConfiguration()
        //-- false = Play video with native device player ; true =  inline
        wconfiguration.allowsInlineMediaPlayback = false
        
        //-- Does not require user inter action for .ie sound auto playback
        wconfiguration.mediaTypesRequiringUserActionForPlayback = []
        
        let webView =  WKWebView(frame: .zero, configuration: wconfiguration)
        
        let theFileName = ("GrinbiSmart_License" as NSString).lastPathComponent
        let htmlPath = Bundle.main.path(forResource: theFileName, ofType: "html")
        
        let folderPath = Bundle.main.bundlePath
        
        let baseUrl = URL(fileURLWithPath: folderPath, isDirectory: true)
        
        do {
            
            let htmlString = try NSString(contentsOfFile: htmlPath!, encoding: String.Encoding.utf8.rawValue)
            
            webView.loadHTMLString(htmlString as String, baseURL: baseUrl)
            
        } catch {
            // catch error
        }//webView.navigationDelegate = self
        
        webView.scrollView.bounces = true // 오버 스크롤
        webView.scrollView.isScrollEnabled = true // 스크롤 위아래
        webView.isOpaque = false
        webView.isHidden = false
        return webView
    }
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WkwebView>) {
        
    }
}

struct TopOfWebViews_Previews: PreviewProvider {
    static var previews: some View {
//        TopOfWebViews(urlOrFile: false, url_top: "https://www.google.com", title_top: "Google")
        TopOfWebViews(urlOrFile: true, url_top: "", title_top: "오픈소스 저작권")
        
    }
}

//
//  GSDefines.h
//  GrinbiSmart
//
//  Created by one4u on 2015. 11. 24..
//
//

//#ifndef GSDefines_h
//#define GSDefines_h
//
//
////        GSColor
//#define GSColor_White                        THColor(255, 255, 255, 1)
//#define GSColor_White_80                    THColor(255, 255, 255, 0.8)
//#define GSColor_BGGray                        THColor(238, 238, 238, 1)
//#define GSColor_MainBlue                    THColor(56, 126, 212, 1)
//#define GSColor_MainBlue_80                    THColor(56, 126, 212, 0.8)
//#define GSColor_FontGray                    THColor(35, 31, 32, 0.55)
//#define GSColor_FontBlack                    THColor(65, 64, 66, 1)
//#define GSColor_FontRed                        THColor(229, 57, 53, 1)
//#define GSColor_BtnDelete                    THColor(255, 23, 68, 1)
//#define GSColor_BtnDeleteOn                    THColor(255, 23, 68, 0.8)
//#define GSColor_Line                        THColor(167, 169, 172, 1)
//#define GSColor_Tab_UnderLine                THColor(255, 209, 128, 1)
//#define GSColor_CircleRed                    THColor(255, 82, 82, 1)
//#define GSColor_Radio_BtnBlue                THColor(179, 229, 252, 1)
//#define GSColor_Conn_Approve                THColor(141, 210, 73, 1)
//#define GSColor_Conn_ApproveOn                THColor(141, 210, 73, 0.85)
//#define GSColor_Conn_OptionBlue                THColor(178, 206, 219, 0.85)
//#define GSColor_Conn_OptionBlueOn            THColor(178, 206, 219, 1)
//#define GSColor_Conn_OptionBlueOn_50        THColor(178, 206, 219, 0.5)
//#define GSColor_Conn_OptionRed                THColor(229, 57, 53, 0.85)
//#define GSColor_Conn_OptionRedOn            THColor(229, 57, 53, 1)
//#define GSColor_Conn_OptionRedOn_50            THColor(229, 57, 53, 0.5)
//#define GSColor_Conn_Timer                    THColor(65, 64, 66, 0.8)
//
//
////
//#define GBColor_Red                            THColor(255, 82, 82, 1.0f)
//#define GBColor_Btn_Gray_Light                THColor(167, 169, 172, 1.0f)
//#define GBColor_Line                        THColor(167, 169, 172, 1.0f)
//#define GBColor_Main_BG                     THColor(248, 248, 248, 1.0f)
//
////
//#define        URL_Company                    @"http://www.ofu.co.kr"
//
//
////
//#define    GrinbiSmart_Terms_URL_Path            @"https://smartmobile.gbphone.co.kr:1004/hospitalterms/mobileagreement"
//#define    GrinbiSmart_Policies_URL_Path        @"https://smartmobile.gbphone.co.kr:1004/hospitalterms/mobileprivateinfo_ios"
//
//#define GrinbiSmart_Terms_File_Path            [[NSBundle mainBundle] pathForResource:@"GrinbiSmart_Terms" ofType:@"html"]
//#define GrinbiSmart_Policies_File_Path        [[NSBundle mainBundle] pathForResource:@"GrinbiSmart_Policies" ofType:@"html"]
//#define GrinbiSmart_License_File_Path        [[NSBundle mainBundle] pathForResource:@"GrinbiSmart_License" ofType:@"html"]
//
//
//
//#endif /* GSDefines_h */
