import Foundation

public class Times: NSObject {

  public static let shared = Times()

  var timesDictionary: [String: Int] {

    get {
      return UserDefaults.standard.object(forKey: "com.times.dictionary") as? [String: Int] ?? [String: Int]()
    }

    set {
      let defaults = UserDefaults.standard
      defaults.set(newValue, forKey: "com.times.dictionary")
      defaults.synchronize()
    }

  }

  var temporaryDictionary: [String: Int]  = [String: Int]()

  public func once(forKey key: String, action: () -> Void) {
    if !timesDictionary.contains(key: key) {
      timesDictionary[key] = 1
      action()
    }
  }

  public func twice(forKey key: String, action: () -> Void) {
    times(2, forKey: key, action: action)
  }

  public func times(_ times: Int, forKey key: String, action: () -> Void) {
    if !timesDictionary.contains(key: key) {
      timesDictionary[key] = 1
      action()
    } else {
      let currentTimes = timesDictionary[key]!
      if currentTimes < 2 {
        timesDictionary[key] = timesDictionary[key]! + 1
        action()
      }
    }
  }

  public func onceForSession(forKey key: String, action: () -> Void) {
    if !temporaryDictionary.contains(key: key) {
      temporaryDictionary[key] = 1
      action()
    }
  }

  public func twiceForSession(forKey key: String, action: () -> Void) {
    timesForSession(2, forKey: key, action: action)
  }

  public func timesForSession(_ times: Int, forKey key: String, action: () -> Void) {
    if !temporaryDictionary.contains(key: key) {
      temporaryDictionary[key] = 1
      action()
    } else {
      let currentTimes = temporaryDictionary[key]!
      if currentTimes < 2 {
        temporaryDictionary[key] = temporaryDictionary[key]! + 1
        action()
      }
    }
  }

}

extension Dictionary where Key == String {

  func contains(key: String) -> Bool {
    return self[key] != nil
  }

}
