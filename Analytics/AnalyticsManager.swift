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

    /// Method for setting user's propreties
    /// - Parameter userProperty: given user's property
    public func set(userProperty: AnalyticsUserProperty) {
        for provider in providers where userProperty.shouldTrack(in: provider) {
            provider.setUserProperty(
                name: userProperty.getName(for: provider),
                value: userProperty.getValue(for: provider)
            )
        }
    }

    /// Method for setting user's identifier
    /// - Parameter userId: giver user's identifier
    public func set(userId: String) {
        for provider in providers {
            provider.setUserId(userId)
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
