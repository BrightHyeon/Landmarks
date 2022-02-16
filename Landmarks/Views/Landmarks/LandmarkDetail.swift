//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by HyeonSoo Kim on 2022/02/16.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            //화면전환 액션을 위해 Link화. 상위뷰에 NavigationView설정 되어있음.
            NavigationLink {
                FullScreenImage(image: landmark.image)
            } label: {
                CircleImage(image: landmark.image)
                    .offset(y: -130) //이미지 위로 올리기(맵뷰에 담기)
                    .padding(.bottom, -130) //이미지 올려도 패딩은 그대로니
            }
            
            VStack(alignment: .leading) { //VStack의 이니셜라이저 편집
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                
                
                HStack {
                    Text(landmark.park)
                    Spacer() //포함하는 뷰가 상위 뷰의 모든 공간을 사용하도록 확장됨
                    Text(landmark.state)
                }
                .font(.subheadline) //Text font가 일치할 시 한 번에 묶기
                .foregroundColor(.secondary)
                
                Divider() //구분선
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Spacer()
                Text(landmark.description)
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        LandmarkDetail(landmark: ModelData().landmarks[0])
            .environmentObject(modelData)
    }
}
