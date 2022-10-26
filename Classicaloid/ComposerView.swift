//
//  ComposerView.swift
//  Classicaloid
//
//  Created by User15 on 10/25/22.
//

import SwiftUI

struct ComposerView: View {
  let composer: Composer
    var body: some View {
      VStack {
        Image(composer.image)
          .resizable()
          .scaledToFill()
          .frame(height: 250)
          .clipped()
        Text(composer.name)
          .font(.custom("Avigea", size: 25))
          .foregroundColor(Color("AccentColor"))
          .padding(.bottom, 25)
      }
      .padding(.bottom)
      .background(Color("TabBarBackground"))
      .cornerRadius(20)
    }
}

struct ComposerView_Previews: PreviewProvider {
    static var previews: some View {
      ComposerView(composer: .previewComposer)
    }
}
