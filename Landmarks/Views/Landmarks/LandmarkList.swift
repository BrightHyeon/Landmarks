//
//  LandmarkList.swift
//  Landmarks
//
//  Created by HyeonSoo Kim on 2022/02/16.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                //List에서 둘 이상의 그룹을 연결하려면 ForEach로 다른 List를 엮어주기.
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
                .navigationTitle("Landmarks")
            }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}

/*
 <List 부연설명>
 
 리스트는 식별가능한 데이터로 작동함. UIKit의 UITableViewControllerDataSource에서 셀 식별하듯이~!
 
 ```
 List(요소: landmarks, id: \.id) { landmark in
    LandmarkRow(landmark: landmark)
 }
 ```
 
 1. 첫번째로 위와 같이 List가 가지는 각 고유 id값을 전달해서 식별가능케하는 방법이 있다.
 
 2. 혹은 실제 상단에 적용한 코드처럼 model(struct)에서 Identifier 프로토콜을 선언함으로써 따로 id값 지정없이 저렇게 깔끔하게 쓸 수도 있다.
 */
