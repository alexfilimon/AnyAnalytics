//
//  AnalyticsEvent.swift
//  Analytics
//
//  Created by Alexander Filimonov on 03/04/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

public protocol AnalyticsEvent {
    func getName(for provider: AnalyticsProvider) -> String
    func getParameters(for provider: AnalyticsProvider) -> [String: Any]
    func shouldTrack(in provider: AnalyticsProvider) -> Bool
}
