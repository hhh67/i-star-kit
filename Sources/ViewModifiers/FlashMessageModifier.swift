// 


import SwiftUI
import Combine

public struct FlashMessageModifier: ViewModifier {
    @Binding var isShow: Bool
    let fontSize: CGFloat = 14
    let width: CGFloat = 140
    let height: CGFloat = 150
    let message: String
    let messageColor: Color = .gray
    let imageSystemName: String
    let imageColor: Color = .gray
    let actSeconds: CGFloat = 1
    
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
            Image(systemName: imageSystemName)
                .font(.system(size: 36, weight: .medium))
                .foregroundStyle(imageColor)
            Spacer()
            Text(message)
                .font(.system(size: fontSize, weight: .regular))
                .multilineTextAlignment(.center)
                .foregroundStyle(messageColor)
        }
        .padding(.top, 44)
        .padding(.bottom, 20)
        .frame(width: width, height: height)
        .background(Blur(style: .systemUltraThinMaterial))
        .cornerRadius(10)
        .opacity(messageOpacity)
        .onAppear {
            playNotificationHaptic(.success)
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
