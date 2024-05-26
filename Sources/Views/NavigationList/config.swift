// 


import SwiftUI

public struct iSKListItemIconConfig {
    let imageName: String
    let isSystemImage: Bool
    let imageForegroundColors: [Color]
    let fgColorStartPoint: UnitPoint
    let fgColorEndPoint: UnitPoint
    let imageBackgroundColors: [Color]
    let bgColorStartPoint: UnitPoint
    let bgColorEndPoint: UnitPoint
    let rotationDegree: Double

    public init(
        imageName: String,
        isSystemImage: Bool = true,
        imageForegroundColors: [Color],
        fgColorStartPoint: UnitPoint = .topLeading,
        fgColorEndPoint: UnitPoint = .bottomTrailing,
        imageBackgroundColors: [Color],
        bgColorStartPoint: UnitPoint = .topLeading,
        bgColorEndPoint: UnitPoint = .bottomTrailing,
        rotationDegree: Double = 0
    ) {
        self.imageName = imageName
        self.isSystemImage = isSystemImage
        self.imageForegroundColors = imageForegroundColors
        self.fgColorStartPoint = fgColorStartPoint
        self.fgColorEndPoint = fgColorEndPoint
        self.imageBackgroundColors = imageBackgroundColors
        self.bgColorStartPoint = bgColorStartPoint
        self.bgColorEndPoint = bgColorEndPoint
        self.rotationDegree = rotationDegree
    }
}
 
