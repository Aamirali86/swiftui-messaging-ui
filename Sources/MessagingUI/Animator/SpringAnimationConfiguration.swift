//
//  SpringAnimationConfiguration.swift
//  MessagingUI
//

import Foundation

/// Spring parameters used by ``SpringAnimator`` and ``SpringScrollAnimator``.
struct SpringAnimationConfiguration: Sendable {

  var stiffness: Double
  var damping: Double

  /// A smooth, non-bouncy spring similar to SwiftUI's `.smooth`.
  static var smooth: Self {
    Self(stiffness: 300, damping: 30)
  }

  /// Creates a spring from duration and bounce values.
  static func duration(_ duration: TimeInterval, bounce: Double) -> Self {
    let stiffness = pow(2 * .pi / duration, 2)
    let damping = 4 * .pi * max(0, 1 - bounce) / duration
    return Self(stiffness: stiffness, damping: damping)
  }

  func update(
    value: inout Double,
    velocity: inout Double,
    target: Double,
    deltaTime: TimeInterval
  ) {
    let displacement = value - target
    let acceleration = -stiffness * displacement - damping * velocity
    velocity += acceleration * deltaTime
    value += velocity * deltaTime
  }
}
