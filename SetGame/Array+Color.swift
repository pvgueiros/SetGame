//
//  Array+Color.swift
//  SetGame
//
//  Created by Paula Vasconcelos Gueiros on 05/04/21.
//

import Foundation
import SwiftUI

extension Array where Element == Color {
    
    func linearGradient() -> LinearGradient? {
        guard self.count > 0 else { return nil }
        
        return LinearGradient(
            gradient: Gradient(colors: self),
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
    }
}
