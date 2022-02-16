//
//  CircleImage.swift
//  Landmarks
//
//  Created by HyeonSoo Kim on 2022/02/16.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle()) //Circle마스크
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            } //원의 stroke(테두리)만 따서 색, 두께 정하고 오버레이
            .shadow(radius: 7) //7포인트 반경의 그림자 추가
            
    } //하얀테두리와 그림자의 조합 good.
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
