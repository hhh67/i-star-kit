// 


import SwiftUI

public struct iSKAsyncAvatar: View {
    let url: String?
    let size: CGFloat
    let altImageSystemName: String
    
    public init(
        url: String?,
        size: CGFloat,
        altImageSystemName: String = "person.circle.fill"
    ) {
        self.url = url
        self.size = size
        self.altImageSystemName = altImageSystemName
    }
    
    public var body: some View {
        Group {
            if let u = url {
                AsyncImage(url: URL(string: u)) { image in
                    image.resizable()
                } placeholder: {
                    Image(systemName: altImageSystemName)
                        .resizable()
                }
            } else {
                Image(systemName: altImageSystemName)
                    .resizable()
            }
        }
        .frame(width: size, height: size)
        .cornerRadius(size / 2)
    }
}
