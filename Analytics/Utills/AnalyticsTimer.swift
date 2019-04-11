//
//  AnalyticsTimer.swift
//  Analytics
//
//  Created by Alexander Filimonov on 04/04/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

import Foundation

class AnalyticsTimer {

    // MARK: - Properties

    var date = NSDate()

    // MARK: - Public methods

    public func invalidate() {
        date = NSDate()
    }

    public func getTimeIntervalSinceLastStart() -> TimeInterval {
        return abs(date.timeIntervalSinceNow)
    }

}
