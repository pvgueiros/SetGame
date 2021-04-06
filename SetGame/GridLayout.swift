//
//  GridLayout.swift
//  Memorize
//
//  Created by CS193p Instructor.
//  Copyright © 2020 Stanford University. All rights reserved.
//

import SwiftUI

struct GridLayout {
	// all private -- cannot be changed. or else someone would think you can change size and expect rowCount and columnCount to change accordingly
    private var size: CGSize
	private var rowCount: Int = 0
	private var columnCount: Int = 0
    private var itemAspectRatio: Double

    init(itemCount: Int, itemAspectRatio: Double = 1, in size: CGSize) {
        self.size = size
        self.itemAspectRatio = min(itemAspectRatio, 1)
        
        // if our size is zero width or height or the itemCount is not > 0
        // then we have no work to do (because our rowCount & columnCount will be zero)
        guard size.width != 0, size.height != 0, itemCount > 0 else { return }

        var bestLayout: (rowCount: Int, columnCount: Int) = (1, itemCount)
        var smallestVariance: Double?
        let sizeAspectRatio = abs(Double(size.width/size.height))
        for rows in 1...itemCount {
            let columns = (itemCount / rows) + (itemCount % rows > 0 ? 1 : 0)
            if (rows - 1) * columns < itemCount {
                let currentAspectRatio = sizeAspectRatio * (Double(rows)/Double(columns))
                let variance = abs(currentAspectRatio - itemAspectRatio)
                if smallestVariance == nil || variance < smallestVariance! {
                    smallestVariance = variance
                    bestLayout = (rowCount: rows, columnCount: columns)
                }
            }
        }
        rowCount = bestLayout.rowCount
        columnCount = bestLayout.columnCount
    }
    
    var itemSize: CGSize {
        if rowCount == 0 || columnCount == 0 {
            return CGSize.zero
        } else {
            let maxWidth = size.width / CGFloat(columnCount)
            let maxHeigth = size.height / CGFloat(rowCount)

            return CGSize(
                width: min(maxWidth, maxHeigth * CGFloat(itemAspectRatio)),
                height: min(maxHeigth, maxWidth / CGFloat(itemAspectRatio))
            )
        }
    }
    
    func location(ofItemAt index: Int, hidden: Bool = false) -> CGPoint {
        if rowCount == 0 || columnCount == 0 {
            return CGPoint.zero
        } else {
            
            // hidden item location
            if hidden {
                return CGPoint(
                    x: -itemSize.width,
                    y: -itemSize.height
                )
            }
            
            // default item location
            return CGPoint(
                x: (CGFloat(index % columnCount) + 0.5) * (size.width / CGFloat(columnCount)),
                y: (CGFloat(index / columnCount) + 0.5) * (size.height / CGFloat(rowCount))
            )
        }
    }
}
