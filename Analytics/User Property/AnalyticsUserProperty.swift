//
//  AnalyticsUserProperty.swift
//  Analytics
//
//  Created by Alexander Filimonov on 11.04.2021.
//  Copyright © 2021 Александр Филимонов. All rights reserved.
//

import Foundation

/// Protocol for describing user property
public protocol AnalyticsUserProperty {

    /// Method for getting name of user property
    /// - Parameter provider: given provider
    func getName(for provider: AnalyticsProvider) -> String

    /// Method for getting value of user property
    /// - Parameter provider: given provider
    func getValue(for provider: AnalyticsProvider) -> String

    /// Method for understanding if this user propery should be tracked or not
    /// - Parameter provider: given provider
    func shouldTrack(in provider: AnalyticsProvider) -> Bool

}

public extension AnalyticsUserProperty {

    func shouldTrack(in provider: AnalyticsProvider) -> Bool {
        return true
    }

}
