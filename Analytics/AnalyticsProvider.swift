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

    /// Method for setting user preoprty's payload
    /// - Parameters:
    ///   - name: name of user property
    ///   - value: value of user property
    func setUserProperty(name: String, value: String)

    /// Method for setting user's identifier
    /// - Parameter id: user's identifier
    func setUserId(_ id: String)

}
