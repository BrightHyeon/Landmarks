//
//  MapView.swift
//  Landmarks
//
//  Created by HyeonSoo Kim on 2022/02/16.
//

import SwiftUI
import MapKit //지도 렌더링하기 위함

/*
 @State 속성을 사용하여 둘 이상의 View에서 수정할 수 있는 앱의 데이터에 대한 정보소스를 설정합니다.
 : 이 View라는 것은 body하나가 아니라 막 Map, Text, Button 하나하나가 View임. 아닌가..?
 
 State속성 변수에 $를 붙이면 기본값에 대한 '참조'와 같은 binding을 전달함.
 : 사용자가 지도와 상호작용할 때 지도는 사용자 인터페이스에 현재 표시되는 지도부분과 일치하도록 지역 값을 업데이트합니다. 서로 참조로 연결되어있으니!
 : 앱 실행 시의 기본값은 아래에서 지정한 것이고, 그 지역 외에도 사용자가 지도를 움직일 때 region변수의 값이 업데이트되며 사용자의 지도부분과 일치하게됩니다.
 : 아래 코드와 같은 경우, 앱 종료 시 다시 기본값으로 됩니다.
 */

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear { //현재좌표를 기반으로 지역 계산을 트리거하는 modifier 추가.
                setRegion(coordinate)
            }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(
            latitude: 34.011_286,
            longitude: -116.166_868)
        )
    }
}
