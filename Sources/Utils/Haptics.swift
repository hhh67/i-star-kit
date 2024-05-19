// 


import UIKit

public class iSKHaptics {
    public static func playImpactHaptic(_ style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }

    public static func playNotificationHaptic(_ type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }

    public static func playSelectionHaptic() {
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
    }
}

public enum Haptics {
    case impact(_ style: UIImpactFeedbackGenerator.FeedbackStyle)
    case notification(_ type: UINotificationFeedbackGenerator.FeedbackType)
    case selection
    
    public func play() {
        switch self {
        case let .impact(style):
            iSKHaptics.playImpactHaptic(style)
        case let .notification(type):
            iSKHaptics.playNotificationHaptic(type)
        case .selection:
            iSKHaptics.playSelectionHaptic()
        }
    }
}
