//
//  AnalyticsManager.swift
//  Analytics
//
//  Created by Alexander Filimonov on 03/04/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

public class AnalyticsManager {

    // MARK: - Public properties

    public static let shared = AnalyticsManager()

    // MARK: - Private properties

    private var providers: [AnalyticsProvider] = []

    // MARK: - Public methods

    public func track(event: AnalyticsEvent) {
        for provider in providers where event.shouldTrack(in: provider) {
            provider.trackEvent(
                name: event.getName(for: provider),
                parameters: event.getParameters(for: provider)
            )
        }
    }

    public func add(provider: AnalyticsProvider) {
        providers.append(provider)
    }

    public func add(providers: [AnalyticsProvider]) {
        self.providers.append(contentsOf: providers)
    }

}
