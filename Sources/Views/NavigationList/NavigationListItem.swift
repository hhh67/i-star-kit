// 


import SwiftUI

public struct iSKNavigationListItem<Destination: View>: View {
    let title: String
    let config: iSKListItemIconConfig
    let destination: Destination
    
    public init(
        _ title: String,
        config: iSKListItemIconConfig,
        destination: Destination
    ) {
        self.title = title
        self.config = config
        self.destination = destination
    }
    
    public var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                iSKNavigationListIcon(
                    config: config
                )
                Text(title)
                    .font(.system(size: 14))
            }
        }
    }
}
