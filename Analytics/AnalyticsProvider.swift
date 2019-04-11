//
//  AnalyticsEngine.swift
//  Analytics
//
//  Created by Alexander Filimonov on 03/04/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

public protocol AnalyticsProvider {
    func trackEvent(name: String, parameters: [String: Any])
}
