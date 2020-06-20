//
//  AnalyticsEvent.swift
//  Analytics
//
//  Created by Alexander Filimonov on 03/04/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

/// Protocol for describing event
public protocol AnalyticsEvent {

    /// Method for getting name of event
    /// - Parameter provider: given provider
    func getName(for provider: AnalyticsProvider) -> String

    /// Method for getting dictionary with parameters
    /// - Parameter provider: given provider
    func getParameters(for provider: AnalyticsProvider) -> [String: Any]

    /// Method for understanding if this event should be tracked or not
    /// - Parameter provider: given provider
    func shouldTrack(in provider: AnalyticsProvider) -> Bool

}

public extension AnalyticsEvent {

    func shouldTrack(in provider: AnalyticsProvider) -> Bool {
        return true
    }

}
