//
//  Composer.swift
//  Classicaloid
//
//  Created by User15 on 10/23/22.
//

import Foundation

struct Composer: Identifiable {
  let id = UUID()
  let image: String
  let name: String
  let birthYear: Int
  let deathYear: Int
  let era: String
  let nationality: String
}

extension Composer {
  static let previewComposer = Composer(image: "Mozart", name: "Wolfgang Amadeus Mozart", birthYear: 1756, deathYear: 1791, era: "Classical", nationality: "Austria")
}
