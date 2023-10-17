//
//  AnalyticsTimer.swift
//  Analytics
//
//  Created by Alexander Filimonov on 04/04/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

import Foundation

/// Class for working with time
public class AnalyticsTimer {

    // MARK: - Constants

    private enum Constants {
        static let roundDidgits = 1
    }

    // MARK: - Private properties

    private var date = NSDate()

    // MARK: - Initialization

    public init() {}

    // MARK: - Public methods

    /// Method for clearing time
    public func invalidate() {
        date = NSDate()
    }

    /// Method for getting current time
    public func getTimeIntervalSinceLastStart() -> TimeInterval {
        date.timeIntervalSinceNow.analytics_rounded(roundDigits: Constants.roundDidgits)
    }

}

public extension Double {

    func analytics_rounded(roundDigits: Int) -> Double {
        let multiplier = pow(10, Double(roundDigits))
        let rounded = Double(Int(Double(self * multiplier).rounded()))
        return rounded / multiplier
    }

}
