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

    // MARK: - Public methods

    /// Method for clearing time
    public func invalidate() {
        date = NSDate()
    }

    /// Method for getting current time
    public func getTimeIntervalSinceLastStart() -> TimeInterval {
        let multiplier = pow(10, Double(Constants.roundDidgits))
        return Darwin.round(abs(date.timeIntervalSinceNow) * multiplier) / multiplier
    }

}
