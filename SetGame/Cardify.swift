//
//  Cardify.swift
//  SetGame
//
//  Created by Paula Vasconcelos Gueiros on 04/04/21.
//

import SwiftUI

struct Cardify: ViewModifier {
    var colorGradient: LinearGradient
    var cornerRadius: CGFloat = 10
    var strokeLineWidth: CGFloat = 2
    var shadowRadius: CGFloat = 3
    
    init(colorGradient: LinearGradient, cornerRadius: CGFloat, strokeLineWidth: CGFloat, shadowRadius: CGFloat) {
        self.colorGradient = colorGradient
        self.cornerRadius = cornerRadius
        self.strokeLineWidth = strokeLineWidth
        self.shadowRadius = shadowRadius
    }
    
    func body(content: Content) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(Color.white)
                .shadow(radius: shadowRadius)
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(lineWidth: strokeLineWidth)
                .fill(colorGradient)
            
            content
        }
    }
}

extension View {
    func cardify(colorGradient: LinearGradient, cornerRadius: CGFloat, strokeLineWidth: CGFloat, shadowRadius: CGFloat) -> some View {
        self.modifier(Cardify(colorGradient: colorGradient, cornerRadius: cornerRadius, strokeLineWidth: strokeLineWidth, shadowRadius: shadowRadius))
    }
}
