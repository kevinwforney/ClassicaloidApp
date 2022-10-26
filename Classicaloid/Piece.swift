//
//  Piece.swift
//  Classicaloid
//
//  Created by User15 on 10/23/22.
//

import Foundation

struct Piece: Identifiable {
  let id = UUID()
  let composer: String
  let title: String
}

extension Piece {
  static let previewPiece = Piece(composer: "Mozart", title: "Eine Kleine Nachtmusik, K 525 - I. Allegro")
}
