//
//  ContentView.swift
//  ImageDocDemo
//
//  Created by 정보경 on 1/16/25.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    @Binding var document: ImageDocDemoDocument
    
    let context = CIContext()
    @State private var ciFilter = CIFilter.sepiaTone()

    var body: some View {
        VStack {
            Image(uiImage: document.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            Button(action: {
                filterImage()
            }, label: {
                Text("Filter Image")
            })
            .padding()
        }
    }
    func filterImage() {
        ciFilter.intensity = Float(1.0)
        
        let ciImage = CIImage(image: document.image)
        
        ciFilter.setValue(ciImage, forKey: kCIInputImageKey)
        
        guard let outputImage = ciFilter.outputImage else { return }
        
        let filteredImage = context.createCGImage(outputImage, from: outputImage.extent)!
        document.image = UIImage(cgImage: filteredImage)
        
    }
}

#Preview {
    ContentView(document: .constant(ImageDocDemoDocument()))
}
