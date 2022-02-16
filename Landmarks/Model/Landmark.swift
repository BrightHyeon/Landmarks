//
//  Landmark.swift
//  Landmarks
//
//  Created by HyeonSoo Kim on 2022/02/16.
//

import Foundation
import SwiftUI //Image객체 사용하기 위함
import CoreLocation //MapKit 프레임워크와 상호작용하기위함

struct Landmark: Hashable, Codable, Identifiable { //hashable한 객체는 고유한 hash값을 가지기에 비교가능.
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    
    //이미지 이름을 읽고 로드하는 기능의 변수들 추가
    private var imageName: String //다른곳에서 이미지불러오는것이 중점이기에 이미지이름은 private하게
    var image: Image {
        Image(imageName)
    }
    
    //다음 단계에서 공개 계산 속성을 생성하는데에만 사용할 것이기에 비공개로 표시
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
