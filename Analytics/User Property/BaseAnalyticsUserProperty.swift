//
//  BaseAnalyticsUserProperty.swift
//  Analytics
//
//  Created by Alexander Filimonov on 11.04.2021.
//  Copyright © 2021 Александр Филимонов. All rights reserved.
//

import Foundation

public protocol BaseAnalyticsUserProperty: AnalyticsUserProperty {

    /// Shared name for all providers
    var name: String { get }

    /// Shared value for all providers
    var value: String { get }
    
}

public extension BaseAnalyticsUserProperty {

    func getName(for provider: AnalyticsProvider) -> String {
        return name
    }

    func getValue(for provider: AnalyticsProvider) -> String {
        return value
    }

}
