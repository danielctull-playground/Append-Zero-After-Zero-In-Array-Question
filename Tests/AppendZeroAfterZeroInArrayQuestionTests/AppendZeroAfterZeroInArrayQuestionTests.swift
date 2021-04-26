
import AppendZeroAfterZeroInArrayQuestion
import XCTest

final class AppendZeroAfterZeroInArrayQuestionTests: XCTestCase {

    func test() {
        XCTAssertEqual(
            [1, 3, 0, 0, 3, 4, 0, 1].appendingZerosAfterZeros(),
            [1, 3, 0, 0, 0, 0, 3, 4]
        )
    }
}

extension Array where Element == Int {

    func appendingZerosAfterZeros() -> [Int] {
        pair(0, with: 0)
            .limitCount(to: count)
            .map { $0 }
    }
}
