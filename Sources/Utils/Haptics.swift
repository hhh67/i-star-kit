// 


import UIKit

public class iSKHaptics {
    static func playImpactHaptic(_ style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }

    static func playNotificationHaptic(_ type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }

    static func playSelectionHaptic() {
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
            playImpactHaptic(style)
        case let .notification(type):
            playNotificationHaptic(type)
        case .selection:
            playSelectionHaptic()
        }
    }
}
