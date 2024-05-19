// 


import SwiftUI
import Combine

public struct iSKFlashMessageModifier: ViewModifier {
    @Binding var isShow: Bool
    let fontSize: CGFloat
    let width: CGFloat
    let height: CGFloat
    let message: String
    let messageColor: Color
    let imageSystemName: String
    let imageColor: Color
    let actSeconds: CGFloat 

    public init(
        isShow: Binding<Bool>,
        fontSize: CGFloat = 14,
        width: CGFloat = 140,
        height: CGFloat = 150,
        message: String,
        messageColor: Color = .gray,
        imageSystemName: String,
        imageColor: Color = .gray,
        actSeconds: CGFloat = 1
    ) {
        _isShow = isShow
        self.fontSize = fontSize
        self.width = width
        self.height = height
        self.message = message
        self.messageColor = messageColor
        self.imageSystemName = imageSystemName
        self.imageColor = imageColor
        self.actSeconds = actSeconds
    }
    
    public func body(content: Content) -> some View {
        content
            .overlay(
                Group {
                    if isShow {
                        FlashMessageView(
                            isShow: $isShow,
                            fontSize: fontSize,
                            width: width,
                            height: height,
                            message: message,
                            messageColor: messageColor,
                            imageSystemName: imageSystemName,
                            imageColor: imageColor,
                            actSeconds: actSeconds
                        )
                    }
                }
            )
    }
}

private struct FlashMessageView: View {
    @Binding var isShow: Bool
    let fontSize: CGFloat
    let width: CGFloat
    let height: CGFloat
    let message: String
    let messageColor: Color
    let imageSystemName: String
    let imageColor: Color
    let actSeconds: CGFloat
    
    @State private var messageOpacity: Double = 0
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Image(systemName: imageSystemName)
                .font(.system(size: 36, weight: .medium))
                .foregroundStyle(imageColor)
                .padding(.bottom, height * 0.1)
            Text(message)
                .font(.system(size: fontSize, weight: .regular))
                .multilineTextAlignment(.center)
                .foregroundStyle(messageColor)
            Spacer()
        }
        .frame(width: width, height: height)
        .background(iSKBlur(.systemUltraThinMaterial))
        .cornerRadius(10)
        .opacity(messageOpacity)
        .onAppear {
            iSKHaptics.playNotificationHaptic(.success)
            withAnimation(.easeInOut(duration: 0.25)) {
                messageOpacity = 1.0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + actSeconds) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    messageOpacity = 0.0
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + actSeconds) {
                    isShow = false
                }
            }
        }
    }
}
