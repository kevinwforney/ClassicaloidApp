//
//  ComposerDetail.swift
//  Classicaloid
//
//  Created by User15 on 10/23/22.
//

import SwiftUI

struct ComposerDetail: View {
  let composer: Composer
  var body: some View {
      //NavigationView {
        GeometryReader { geometry in
          ScrollView {
            ZStack {
              Image(composer.image)
                .resizable()
                .scaledToFit()
                .blur(radius: 30)
              Image(composer.image)
                .resizable()
                .scaledToFit()
                .mask(
                  Image("mask")
                    .resizable()
                    .scaledToFill())
            }
            Text(composer.name)
              .font(.custom("Avigea", size: 30))
              .padding(.top)
            Text("(\(String(composer.birthYear))-\(String(composer.deathYear)))")
              .font(.custom("Avigea", size: 25))
            HStack {
              VStack {
                Image(composer.nationality)
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width: geometry.size.width/2, height: 80)
                Text(composer.nationality)
                  .font(.custom("Avigea", size: 25))
              }
              VStack {
                Image(systemName: "music.note")
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width: geometry.size.width/2, height: 80)
                  .foregroundColor(Color("AccentColor"))
                Text(composer.era)
                  .font(.custom("Avigea", size: 25))
              }
            }
            ///////////////////WORKS
            Spacer()
          }
          .background(Color("PageBackground"))
          .foregroundColor(Color("AccentColor"))
          .edgesIgnoringSafeArea(.all)
        }
      //}
  }
}

struct ComposerDetail_Previews: PreviewProvider {
    static var previews: some View {
      ComposerDetail(composer: .previewComposer)
        .preferredColorScheme(.dark)
    }
}
