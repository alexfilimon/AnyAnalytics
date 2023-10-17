import Foundation
import XCTest

class DoubleRoundTests: XCTestCase {

    func test_case_1_digit() {
        // given
        let originals = [
            0.122,
            0.155,

            0.222,
            0.255,

            0.322,
            0.355,

            0.422,
            0.455,

            0.522,
            0.555,

            0.622,
            0.655,

            0.722,
            0.755,

            0.822,
            0.855,

            0.922,
            0.955
        ]
        let expecteds = [
            "0.1",
            "0.2",

            "0.2",
            "0.3",

            "0.3",
            "0.4",

            "0.4",
            "0.5",

            "0.5",
            "0.6",

            "0.6",
            "0.7",

            "0.7",
            "0.8",

            "0.8",
            "0.9",

            "0.9",
            "1.0"
        ]

        // when
        let results = originals.map { $0.analytics_rounded(roundDigits: 1).description }

        // then
        for (index, _) in originals.enumerated() {
            XCTAssertEqual(expecteds[index], results[index])
        }
    }

    func test_case_2_digits() {
        // given
        let originals = [
            0.122,
            0.155,

            0.222,
            0.255,

            0.322,
            0.355,

            0.422,
            0.455,

            0.522,
            0.555,

            0.622,
            0.655,

            0.722,
            0.755,

            0.822,
            0.855,

            0.922,
            0.955
        ]
        let expecteds = [
            "0.12",
            "0.16",

            "0.22",
            "0.26",

            "0.32",
            "0.36",

            "0.42",
            "0.46",

            "0.52",
            "0.56",

            "0.62",
            "0.66",

            "0.72",
            "0.76",

            "0.82",
            "0.86",

            "0.92",
            "0.96"
        ]

        // when
        let results = originals.map { $0.analytics_rounded(roundDigits: 2).description }

        // then
        for (index, _) in originals.enumerated() {
            XCTAssertEqual(expecteds[index], results[index])
        }
    }

}

