import XCTest
@testable import Times

class TimesTests: XCTestCase {

    override func setUpWithError() throws {
        super.setUp()
        // Instead of directly clearing dictionaries, reset or initialize conditions to ensure a clean state for each test
        // This might involve creating a reset function in the Times class (for testing purposes) or ensuring each test uses unique keys
    }

    func testOnceExecutesOnce() throws {
        var executionCount = 0
        let key = "testOnce"

        // Execute the block once
        Times.once.forKey(key) {
            executionCount += 1
        }

        // Attempt to execute the block again
        Times.once.forKey(key) {
            executionCount += 1
        }

        XCTAssertEqual(executionCount, 1, "The block should only execute once")
    }

    func testTwiceExecutesTwice() throws {
        var executionCount = 0
        let key = "testTwice"

        // Execute the block twice
        Times.t(2).forKey(key) {
            executionCount += 1
        }

        Times.t(2).forKey(key) {
            executionCount += 1
        }

        // Attempt to execute the block a third time
        Times.t(2).forKey(key) {
            executionCount += 1
        }

        XCTAssertEqual(executionCount, 2, "The block should execute exactly twice")
    }

    func testOnceForSessionExecutesOncePerSession() throws {
        var executionCount = 0
        let key = "testSessionOnce"

        // Execute the block once per session
        Times.onceForSession.forKey(key) {
            executionCount += 1
        }

        // Attempt to execute the block again in the same session
        Times.onceForSession.forKey(key) {
            executionCount += 1
        }

        XCTAssertEqual(executionCount, 1, "The block should only execute once per session")
    }

    func testTimesForSessionExecutesSpecificNumberOfTimesPerSession() throws {
        var executionCount = 0
        let key = "testSessionTimes"
        let executeTimes = 3

        // Execute the block specific number of times per session
        for _ in 0..<executeTimes {
            Times.t(executeTimes, scope: .session).forKey(key) {
                executionCount += 1
            }
        }

        // Attempt to execute the block again beyond the limit
        Times.t(executeTimes, scope: .session).forKey(key) {
            executionCount += 1
        }

        XCTAssertEqual(executionCount, executeTimes, "The block should execute exactly \(executeTimes) times per session")
    }

    // Add more tests as needed to cover different scenarios and edge cases
}
