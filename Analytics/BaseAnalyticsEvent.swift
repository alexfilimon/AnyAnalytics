//
//  BaseAnalyticsEvent.swift
//  Analytics
//
//  Created by Alexander Filimonov on 19/06/2020.
//  Copyright © 2020 Александр Филимонов. All rights reserved.
//

/// Base analytics protocol for event, those name and parameters
/// don't change between providers
public protocol BaseAnalyticsEvent: AnalyticsEvent {

    /// Shared name for all providers
    var name: String { get }

    /// Shared parameters for all providers
    var parameters: [String: Any] { get }

}

public extension BaseAnalyticsEvent {

    func getName(for provider: AnalyticsProvider) -> String {
        return name
    }

    func getParameters(for provider: AnalyticsProvider) -> [String: Any] {
        return parameters
    }

}
