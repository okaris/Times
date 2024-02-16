import Foundation

public class Times {

    public static let shared = Times()

    private var timesDictionary: [String: Int] {
        get {
            return UserDefaults.standard.object(forKey: "com.times.dictionary") as? [String: Int] ?? [String: Int]()
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "com.times.dictionary")
        }
    }

    private var temporaryDictionary: [String: Int] = [String: Int]()

    public enum Scope {
        case forever
        case session
    }

    public class Action {
        private let times: Int
        private let scope: Scope

        init(times: Int, scope: Scope) {
            self.times = times
            self.scope = scope
        }

        public func forKey(_ key: String? = nil, action: @escaping () -> Void) {
            let effectiveKey = key ?? UUID().uuidString // Use supplied key or generate a UUID
            switch scope {
            case .forever:
                Times.shared.performAction(self.times, forKey: effectiveKey, using: &Times.shared.timesDictionary, action: action)
            case .session:
                Times.shared.performAction(self.times, forKey: effectiveKey, using: &Times.shared.temporaryDictionary, action: action)
            }
        }
        
        // Allows direct invocation without specifying a key
        public func perform(_ action: @escaping () -> Void) {
            forKey(nil, action: action)
        }
    }

    public static var once: Action {
        return Action(times: 1, scope: .forever)
    }

    public static var onceForSession: Action {
        return Action(times: 1, scope: .session)
    }

    public static func t(_ times: Int, scope: Scope = .forever) -> Action {
        return Action(times: times, scope: scope)
    }

    private func performAction(_ times: Int, forKey key: String, using dictionary: inout [String: Int], action: @escaping () -> Void) {
        let count = dictionary[key] ?? 0
        if count < times {
            dictionary[key] = count + 1
            action()
        }
    }
}