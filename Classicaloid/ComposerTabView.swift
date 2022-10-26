//
//  ComposerTabView.swift
//  Classicaloid
//
//  Created by User15 on 10/24/22.
//

import SwiftUI

struct ComposerTabView: View {
  init() {
    UITableView.appearance().backgroundColor = .init(Color("PageBackground"))
  }
  let favorites = [
    "Bach",
    "Mozart",
    "Beethoven",
    "Chopin",
    "Tchaikovsky",
    "Liszt",
    "Rachmaninoff",
    "Debussy",
    "Shostakovich",
    "Ravel"
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
            ScrollView(.horizontal, showsIndicators: false) {
              let rows = [GridItem()]
              LazyHGrid(rows: rows) {
                ForEach(favorites.indices, id: \.self) {
                  item in Image(favorites[item])
                    .resizable()
                    .frame(width: 280, height: 280)
                }
              }
              .frame(height: 150)
            }
            NavigationView {
              List {
                SectionView(era: "Baroque")
                SectionView(era: "Classical")
                SectionView(era: "Romantic")
                SectionView(era: "Modern")
              }
              .navigationBarTitle("Composer")
              //.navigationBarHidden(true)
            }
          }
        }
      }
      .edgesIgnoringSafeArea(.all)
    }
}

struct ComposerTabView_Previews: PreviewProvider {
    static var previews: some View {
        ComposerTabView()
          .preferredColorScheme(.light)
    }
}

struct HeaderView: View {
  let header: String
  var body: some View {
    HStack {
      Text(header)
        .font(.custom("Avigea", size: 25))
        .foregroundColor(Color("AccentColor"))
        .padding()
      Spacer()
    }
    .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color("PageBackground")]), startPoint: .leading, endPoint: .trailing))
    .listRowInsets(EdgeInsets(
                    top: 0,
                    leading: 0,
                    bottom: 0,
                    trailing: 0))
  }
}

struct SectionView: View {
  let era: String
  let composersBaroque = [
    Composer(image: "Bach", name: "Johann Sebastian Bach", birthYear: 1685, deathYear: 1750, era: "Baroque", nationality: "Germany"),
    Composer(image: "Handel", name: "George Frideric Handel", birthYear: 1685, deathYear: 1759, era: "Baroque", nationality: "UK"),
    Composer(image: "Vivaldi", name: "Antonio Vivaldi", birthYear: 1678, deathYear: 1741, era: "Baroque", nationality: "Italy"),
    Composer(image: "Pachelbel", name: "Johann Pachelbel", birthYear: 1653, deathYear: 1706, era: "Baroque", nationality: "Germany"),
    Composer(image: "Purcell", name: "Henry Purcell", birthYear: 1659, deathYear: 1695, era: "Baroque", nationality: "UK")
  ]
  let composersClassical = [
    Composer(image: "Mozart", name: "Wolfgang Amadeus Mozart", birthYear: 1756, deathYear: 1791, era: "Classical", nationality: "Austria"),
    Composer(image: "Beethoven", name: "Ludwig van Beethoven", birthYear: 1770, deathYear: 1827, era: "Classical", nationality: "Germany"),
    Composer(image: "Schubert", name: "Franz Schubert", birthYear: 1797, deathYear: 1828, era: "Classical", nationality: "Austria"),
    Composer(image: "Haydn", name: "Joseph Haydn", birthYear: 1732, deathYear: 1809, era: "Classical", nationality: "Austria"),
    Composer(image: "Rossini", name: "Gioachino Rossini", birthYear: 1792, deathYear: 1868, era: "Classical", nationality: "Italy"),
    Composer(image: "Boccherini", name: "Luigi Boccherini", birthYear: 1743, deathYear: 1805, era: "Classical", nationality: "Italy")
  ]
  let composersRomantic = [
    Composer(image: "Chopin", name: "Frédéric Chopin", birthYear: 1810, deathYear: 1849, era: "Romantic", nationality: "Poland"),
    Composer(image: "Tchaikovsky", name: "Pyotr Ilyich Tchaikovsky", birthYear: 1840, deathYear: 1893, era: "Romantic", nationality: "Russia"),
    Composer(image: "Brahms", name: "Johannes Brahms", birthYear: 1833, deathYear: 1897, era: "Romantic", nationality: "Germany"),
    Composer(image: "Liszt", name: "Franz Liszt", birthYear: 1811, deathYear: 1886, era: "Romantic", nationality: "Hungary"),
    Composer(image: "Rachmaninoff", name: "Sergei Rachmaninoff", birthYear: 1873, deathYear: 1943, era: "Romantic", nationality: "Russia"),
    Composer(image: "Verdi", name: "Giuseppe Verdi", birthYear: 1813, deathYear: 1901, era: "Romantic", nationality: "Italy"),
    Composer(image: "Dvorak", name: "Antonín Dvořák", birthYear: 1841, deathYear: 1904, era: "Romantic", nationality: "Czech"),
    Composer(image: "Mendelssohn", name: "Felix Mendelssohn", birthYear: 1809, deathYear: 1847, era: "Romantic", nationality: "Germany"),
    Composer(image: "Wagner", name: "Richard Wagner", birthYear: 1813, deathYear: 1883, era: "Romantic", nationality: "Germany")
  ]
  let composersModern = [
    Composer(image: "Debussy", name: "Claude Debussy", birthYear: 1862, deathYear: 1918, era: "Modern", nationality: "France"),
    Composer(image: "Shostakovich", name: "Dmitri Shostakovich", birthYear: 1906, deathYear: 1975, era: "Modern", nationality: "Russia"),
    Composer(image: "Ravel", name: "Maurice Ravel", birthYear: 1875, deathYear: 1937, era: "Modern", nationality: "France"),
    Composer(image: "Gershwin", name: "George Gershwin", birthYear: 1898, deathYear: 1937, era: "Modern", nationality: "USA"),
    Composer(image: "Strauss", name: "Richard Strauss", birthYear: 1864, deathYear: 1949, era: "Modern", nationality: "Germany")
  ]
  var body: some View {
    Section(header: HeaderView(header: era)) {
      TabView {
        if era == "Baroque" {
          ForEach(composersBaroque, id: \.id) {
            composer in NavigationLink (
              destination: ComposerDetail(composer: composer),
              label: {
                ComposerView(composer: composer)
              })
          }
        } else if era == "Classical" {
          ForEach(composersClassical, id: \.id) {
            composer in NavigationLink (
              destination: ComposerDetail(composer: composer),
              label: {
                ComposerView(composer: composer)
              })
          }
        } else if era == "Romantic" {
          ForEach(composersRomantic, id: \.id) {
            composer in NavigationLink (
              destination: ComposerDetail(composer: composer),
              label: {
                ComposerView(composer: composer)
              })
          }
        } else if era == "Modern" {
          ForEach(composersModern, id: \.id) {
            composer in NavigationLink (
              destination: ComposerDetail(composer: composer),
              label: {
                ComposerView(composer: composer)
              })
          }
        }
      }
      .tabViewStyle(PageTabViewStyle())
    }
    .listRowInsets(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
    .listRowBackground(Color("PageBackground"))
  }
}
