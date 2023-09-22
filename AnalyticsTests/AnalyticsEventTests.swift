//
//  AnalyticsEventTests.swift
//  AnalyticsTests
//
//  Created by Alexander Filimonov on 20/06/2020.
//  Copyright © 2020 Александр Филимонов. All rights reserved.
//

import XCTest
@testable import AnyAnalytics

class AnalyticsEventTests: XCTestCase {

    func testThatEventTracks() {
        // given
        let someAnalyticsProvider = MockAnalyticsProvider()
        AnalyticsManager.shared.add(provider: someAnalyticsProvider)
        let eventName = "event"
        let event = SomeAnalyticsEvent(name: eventName, parameters: [:])

        // when
        AnalyticsManager.shared.track(event: event)

        // then
        XCTAssertEqual(eventName, someAnalyticsProvider.lastTrackEvent)
    }

    func testMultipleProvidersTrackEvents() {
        // given
        let someAnalyticsProvider = MockAnalyticsProvider()
        let otherAnalyticsProvider = MockAnalyticsProvider()
        AnalyticsManager.shared.add(providers: [someAnalyticsProvider, otherAnalyticsProvider])
        let eventName = "event"
        let event = SomeAnalyticsEvent(name: eventName, parameters: [:])

        // when
        AnalyticsManager.shared.track(event: event)
        AnalyticsManager.shared.track(event: event)

        // then
        let numberOfTrackings = [someAnalyticsProvider, otherAnalyticsProvider].reduce(0) { (result, provider) -> Int in
            result + provider.numberOfTracks
        }
        XCTAssertEqual(numberOfTrackings, 4)
    }

    func testThatEventTracksWithNonAllProviders() {
        // given
        let someAnalyticsProvider = MockAnalyticsProvider()
        let nonTrackAnalyticsProvider = NonTrackingAnalyticsProvider()
        AnalyticsManager.shared.add(providers: [someAnalyticsProvider, nonTrackAnalyticsProvider])
        let eventName = "event"
        let event = AnalyticsEventThatTracksNonAllProviders(name: eventName, parameters: [:])

        // when
        AnalyticsManager.shared.track(event: event)

        // then
        XCTAssertEqual(eventName, someAnalyticsProvider.lastTrackEvent)
        XCTAssertEqual(someAnalyticsProvider.numberOfTracks, 1)
        XCTAssertEqual(nonTrackAnalyticsProvider.numberOfTracks, 0)
    }

}

// MARK: - Private Helpers

private struct SomeAnalyticsEvent: BaseAnalyticsEvent {

    // MARK: - Properties

    var name: String
    var parameters: [String: Any]

}

private class MockAnalyticsProvider: AnalyticsProvider {

    // MARK: - Properties

    var lastTrackEvent: String?
    var numberOfTracks = 0

    // MARK: - AnalyticsProvider

    func trackEvent(name: String, parameters: [String : Any]) {
        lastTrackEvent = name
        numberOfTracks += 1
    }

    func setUserProperty(name: String, value: String) {}

    func setUserId(_ id: String) {}

}

private struct AnalyticsEventThatTracksNonAllProviders: AnalyticsEvent {

    // MARK: - Properties

    var name: String
    var parameters: [String: Any]

    // MARK: - AnalyticsEvent

    func getParameters(for provider: AnalyticsProvider) -> [String: Any] {
        parameters
    }

    func getName(for provider: AnalyticsProvider) -> String {
        name
    }

    func shouldTrack(in provider: AnalyticsProvider) -> Bool {
        return !(provider is NonTrackingAnalyticsProvider)
    }

}

private class NonTrackingAnalyticsProvider: AnalyticsProvider {

    // MARK: - Properties

    var numberOfTracks = 0

    // MARK: - AnalyticsProvider

    func trackEvent(name: String, parameters: [String : Any]) {
        numberOfTracks += 1
    }

    func setUserProperty(name: String, value: String) {}

    func setUserId(_ id: String) {}

}
