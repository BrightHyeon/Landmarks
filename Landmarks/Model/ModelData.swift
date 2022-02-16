//
//  ModelData.swift
//  Landmarks
//
//  Created by HyeonSoo Kim on 2022/02/16.
//

import Foundation
import Combine //ObservableObject 사용위함.

final class ModelData: ObservableObject { //직역하면 '관찰가능한객체'
    //관찰가능한객체는 구독자가 변경사항을 선택할 수 있도록 데이터에 대한 모든 변경 사항을 게시해야합니다.
    @Published var landmarks: [Landmark] = load("landmarkData.json") //기존 landmarks를 이 class안으로 가져오기.
}

//var landmarks: [Landmark] = load("landmarkData.json") //json데이터를 만든 load메서드 통해 불러오기.

//load(_:) 메서드 생성;; 앱의 기본 bundle에서 지정된 이름의 JSON데이터를 가져오는 메서드
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle: \n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self): \n\(error)")
    }
    
    
}

/*
 ObservableObject: SwiftUI는 관찰 가능한 객체를 구독하고 데이터가 변경될 때 새로 고쳐야 하는 모든 뷰를 업데이트합니다.
 음 didSet이나 NotificationCenter의 Observer랑 비슷한 느낌이군요.
 
 어떤 특정 랜드마크가 즐겨찾기인지 사용자가 제어할 수 있도록 준비하려면 먼저 landmarks 데이터를 관찰 가능한 객체에 저장해야하기에 이런 과정을 함.
 
 이제 객체를 생성했으므로 뷰를 업데이트하여 앱의 데이터 저장소로 채택해야 함.
 */
