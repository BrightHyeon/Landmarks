//
//  ContentView.swift
//  Landmarks
//
//  Created by HyeonSoo Kim on 2022/02/16.
//

import SwiftUI

struct ContentView: View { //View 프로토콜
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider { //미리보기 선언
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}

/*
 SwiftUI View를 사용자 정의하려면 modifier라는 메소드를 호출.
 
 modifier는 View를 Wrapping하여 속성을 변경합니다.
 
 각 modifier는 새로운 View를 반환하므로 수직으로 쌓인 여러 modifier를 연결하는 것이 일반적입니다.
 
 */
