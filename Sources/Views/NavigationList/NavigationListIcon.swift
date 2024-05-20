// 


import SwiftUI

public struct iSKNavigationListIcon: View {
    let config: iSKListItemIconConfig
    
    public init(
        config: iSKListItemIconConfig
    ) {
        self.config = config
    }
    
    public var body: some View {
        Group {
            if config.isSystemImage {
                Image(systemName: config.imageName)
            } else {
                Image(config.imageName)
            }
        }
        .rotationEffect(.degrees(config.rotationDegree))
        .font(.system(size: 15))
        .frame(width: 22, height: 22)
        .padding(3)
        .foregroundStyle(
            .linearGradient(
                Gradient(colors: config.imageForegroundColors), 
                startPoint: config.fgColorStartPoint,
                endPoint: config.fgColorEndPoint
            )
        )
        .background(
            .linearGradient(
                Gradient(colors: config.imageBackgroundColors),
                startPoint: config.bgColorStartPoint,
                endPoint: config.bgColorEndPoint
            )
        )
        .cornerRadius(4)
        .padding(.trailing, 4)
        .opacity(0.8)
    }
}
