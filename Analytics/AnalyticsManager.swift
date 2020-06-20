//
//  AnalyticsManager.swift
//  Analytics
//
//  Created by Alexander Filimonov on 03/04/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

/// Manager for tracking events
public class AnalyticsManager {

    // MARK: - Public properties

    public static let shared = AnalyticsManager()

    // MARK: - Private properties

    private var providers: [AnalyticsProvider] = []

    // MARK: - Public methods

    /// Method for tracking given event
    /// - Parameter event: some event
    public func track(event: AnalyticsEvent) {
        for provider in providers where event.shouldTrack(in: provider) {
            provider.trackEvent(
                name: event.getName(for: provider),
                parameters: event.getParameters(for: provider)
            )
        }
    }

    /// Method for configuring manager with provider
    /// - Parameter provider: given provider
    public func add(provider: AnalyticsProvider) {
        providers.append(provider)
    }

    /// Method for configuring manager with providers
    /// - Parameter providers: given providers
    public func add(providers: [AnalyticsProvider]) {
        self.providers.append(contentsOf: providers)
    }

}
