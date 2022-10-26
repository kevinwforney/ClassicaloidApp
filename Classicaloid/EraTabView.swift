//
//  EraTabView.swift
//  Classicaloid
//
//  Created by User15 on 10/23/22.
//

import SwiftUI

struct EraTabView: View {
    let eras = [
        "Baroque",
        "Classical",
        "Romantic",
        "Modern"
    ]
    var body: some View {
      ZStack {
        Color("PageBackground")
        GeometryReader { geometry in
          VStack {
            HStack {
              Text("CLASSICALOID")
                .AppHeaderStyle()
            }
            .frame(width: geometry.size.width, height: geometry.size.height/8)
            .background(Color("TabBarBackground").shadow(color: Color("AccentColor"), radius: 5))
        ScrollView {
          let columns = [GridItem(spacing: 5), GridItem()]
          LazyVGrid(columns: columns, spacing: 5) {
              ForEach(eras.indices, id: \.self) { item in
                  EraView(era: eras[item])
              }
            }
          }
        }
      }
    }
    .edgesIgnoringSafeArea(.all)
  }
}

struct EraTabView_Previews: PreviewProvider {
    static var previews: some View {
        EraTabView()
          .preferredColorScheme(.dark)
    }
}

struct EraView: View {
    let era: String
    var body: some View {
        VStack {
          if era == "Baroque" {
            Image("Bach")
              .resizable()
              .scaledToFill()
              .frame(height: 180)
              .clipped()
            Text("B").font(.custom("Avigea", size: 40))
              .foregroundColor(.white).underline() + Text("aroque")
              .font(.custom("Avigea", size: 35))
              .foregroundColor(Color("AccentColor"))
            Text("(").font(.custom("Avigea", size: 25))
              .foregroundColor(.orange) + Text("1580-1750").font(.custom("Avigea", size: 25))
              .foregroundColor(Color("AccentColor")) + Text(")")
              .font(.custom("Avigea", size: 25))
              .foregroundColor(.orange)
          } else if era == "Classical" {
            Image("Beethoven")
              .resizable()
              .scaledToFill()
              .frame(height: 180)
              .clipped()
            Text("C").font(.custom("Avigea", size: 40))
              .foregroundColor(.white).underline() + Text("lassical")
              .font(.custom("Avigea", size: 35))
              .foregroundColor(Color("AccentColor"))
            Text("(").font(.custom("Avigea", size: 25))
              .foregroundColor(.orange) + Text("1750-1820").font(.custom("Avigea", size: 25))
              .foregroundColor(Color("AccentColor")) + Text(")")
              .font(.custom("Avigea", size: 25))
              .foregroundColor(.orange)
          } else if era == "Romantic" {
            Image("Tchaikovsky")
              .resizable()
              .scaledToFill()
              .frame(height: 180)
              .clipped()
            Text("R").font(.custom("Avigea", size: 40))
              .foregroundColor(.white).underline() + Text("omantic")
              .font(.custom("Avigea", size: 35))
              .foregroundColor(Color("AccentColor"))
            Text("(").font(.custom("Avigea", size: 25))
              .foregroundColor(.orange) + Text("1800-1910").font(.custom("Avigea", size: 25))
              .foregroundColor(Color("AccentColor")) + Text(")")
              .font(.custom("Avigea", size: 25))
              .foregroundColor(.orange)
          } else if era == "Modern" {
            Image("Ravel")
              .resizable()
              .scaledToFill()
              .frame(height: 180)
              .clipped()
            Text("M").font(.custom("Avigea", size: 40))
              .foregroundColor(.white).underline() + Text("odern")
              .font(.custom("Avigea", size: 35))
              .foregroundColor(Color("AccentColor"))
            Text("(").font(.custom("Avigea", size: 25))
              .foregroundColor(.orange) + Text("1890-1975").font(.custom("Avigea", size: 25))
              .foregroundColor(Color("AccentColor")) + Text(")")
              .font(.custom("Avigea", size: 25))
              .foregroundColor(.orange)
          }
        }
        .padding(.bottom)
        .background(Color("TabBarBackground"))
          .cornerRadius(20)
    }
}
