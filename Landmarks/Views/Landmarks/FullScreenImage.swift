//
//  FullScreenImage.swift
//  Landmarks
//
//  Created by HyeonSoo Kim on 2022/02/16.
//

import SwiftUI

struct FullScreenImage: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct FullScreenImage_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenImage(image: ModelData().landmarks[0].image)
    }
}
