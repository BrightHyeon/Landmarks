//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by HyeonSoo Kim on 2022/02/16.
//

import SwiftUI

//SwiftUI 앱 라이프사이클

@main //main앱의 진입점을 식별
struct LandmarksApp: App { //App 프로토콜 준수
    @StateObject private var modelData = ModelData() //앱실행 시 환경에 모델 객체를 배치하도록 앱 인스턴스를 업데이트.
    
    var body: some Scene { //하나 이상의 Scene을 반환.
        WindowGroup {
            ContentView() //차례로 표시할 콘텐츠를 제공
                .environmentObject(modelData)
        }
    }
}
