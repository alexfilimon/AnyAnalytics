//
//  AnalyticsEngine.swift
//  Analytics
//
//  Created by Alexander Filimonov on 03/04/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

/// Protocol for describing provider
public protocol AnalyticsProvider {

    /// Method for tracking event's payload
    /// - Parameters:
    ///   - name: name of event
    ///   - parameters: parameters of event
    func trackEvent(name: String, parameters: [String: Any])

}
