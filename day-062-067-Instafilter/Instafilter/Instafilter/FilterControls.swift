//
//  FilterControls.swift
//  Instafilter
//
//  Created by Jevgeni Vakker on 18.08.2023.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct FilterControls: View {
    @Binding var filterIntensity: Float
    @Binding var filterRadius: Float
    @Binding var filterScale: Float
    @Binding var currentFilter: CIFilter
    
    var body: some View {
        VStack(spacing: 20) {
            let inputKeys = currentFilter.inputKeys
            if inputKeys.contains(kCIInputIntensityKey) {
                HStack {
                    Text("Intensity")
                        .frame(minWidth: 70, alignment: .leading)
                    Slider(value: $filterIntensity)
                }
            }
            if inputKeys.contains(kCIInputRadiusKey) {
                HStack {
                    Text("Radius")
                        .frame(minWidth: 70, alignment: .leading)
                    Slider(value: $filterRadius)
                }
            }
            if inputKeys.contains(kCIInputScaleKey) {
                HStack {
                    Text("Scale")
                        .frame(minWidth: 70, alignment: .leading)
                    Slider(value: $filterScale)
                }
            }
        }
        .padding([.vertical])
    }
}

struct FilterControls_Previews: PreviewProvider {
    static var previews: some View {
        FilterControls(filterIntensity: .constant(0.5), filterRadius: .constant(0.5), filterScale: .constant(0.5), currentFilter: .constant(CIFilter.sepiaTone()))
    }
}
