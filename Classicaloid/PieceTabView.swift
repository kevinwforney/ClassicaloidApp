//
//  PieceTabView.swift
//  Classicaloid
//
//  Created by User15 on 10/23/22.
//

import SwiftUI
import AVFoundation

struct PieceTabView: View {
  let piece: Piece
  let pieces = [
    Piece(composer: "Bach", title: "Toccata and Fugue D Minor, BWV 565"),
    Piece(composer: "Bach", title: "Cello Suite No. 1 in G Major, BWV 1007"),
    Piece(composer: "Handel", title: "Messiah, HWV 56"),
    Piece(composer: "Vivaldi", title: "The Four Seasons - Spring, Concerto No. 1 in E Major, RV 269"),
    Piece(composer: "Pachelbel", title: "Canon in D, P 37"),
    Piece(composer: "Mozart", title: "Eine Kleine Nachtmusik, K 525 - I. Allegro"),
    Piece(composer: "Mozart", title: "Eine Kleine Nachtmusik, K 525 - II. Romanze - Andante"),
    Piece(composer: "Mozart", title: "Eine Kleine Nachtmusik, K 525 - III. Menuetto - Allegretto"),
    Piece(composer: "Mozart", title: "Eine Kleine Nachtmusik, K 525 - IV. Rondo - Allegro"),
    Piece(composer: "Mozart", title: "Piano Sonata No. 11 in A Major, K 331 - III. Alla Turca"),
    Piece(composer: "Beethoven", title: "Symphony No. 5, Op. 67 - I. Allegro con brio"),
    Piece(composer: "Beethoven", title: "Fur Elise"),
    Piece(composer: "Beethoven", title: "Piano Sonata No. 14 in C-sharp minor, Moonlight Sonata - I. Adagio Sostenuto"),
    Piece(composer: "Haydn", title: "Trumpet Concerto, 3rd Mvt"),
    Piece(composer: "Rossini", title: "William Tell Overture - Finale"),
    Piece(composer: "Boccherini", title: "String Quintet in E major, Op. 11, No. 5"),
    Piece(composer: "Chopin", title: "Nocturne in E Flat Major, Op. 9, No.2"),
    Piece(composer: "Tchaikovsky", title: "Swan Lake Suite, Op 20 - Enchanted Lake"),
    Piece(composer: "Tchaikovsky", title: "Nutcracker Suite, Op. 71a - 2a. March"),
    Piece(composer: "Brahms", title: "Hungarian Dances, WoO 1, No. 5 in G Minor - Allegro vivace"),
    Piece(composer: "Liszt", title: "Grandes etudes de Paganini, S.141 - No. 3 in G Sharp Minor, La Campanella"),
    Piece(composer: "Verdi", title: "Requiem, Dies Irae"),
    Piece(composer: "Dvorak", title: "Symphony No. 9, From the New World"),
    Piece(composer: "Mendelssohn", title: "Violin Concerto in E minor, Op.64"),
    Piece(composer: "Debussy", title: "Suite bergamasque, CD 82, L. 75 - III. Clair de lune"),
    Piece(composer: "Shostakovich", title: "Waltz No. 2"),
    Piece(composer: "Ravel", title: "Bolero, M. 81"),
    Piece(composer: "Gershwin", title: "Rhapsody in Blue")
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
              VStack(spacing: 140) {
                    ForEach(pieces.indices, id: \.self) { item in
                        PieceRow(piece: pieces[item])
                    }
              }
            }
          }
        }
      }
      .edgesIgnoringSafeArea(.all)
    }
}

struct PieceTabView_Previews: PreviewProvider {
    static var previews: some View {
      PieceTabView(piece: .previewPiece)
        .preferredColorScheme(.light)
    }
}

struct ButtonView: View {
    let imageState: String
    var body: some View {
        ZStack {
          Circle()
            .frame(width: 35, height: 35)
            .foregroundColor(Color("AccentColor"))
          Image(systemName: imageState)
            .resizable()
            .frame(width: 35, height: 35)
            .foregroundColor(.orange)
            .overlay(Circle().stroke(Color("AccentColor"), lineWidth: 5))
        }
    }
}

struct PieceRow: View {
  let piece: Piece
  let player = AVPlayer()
  @State private var isPlaying = false
  @State private var offset: CGFloat = UIScreen.main.bounds.width-20
  var body: some View {
    GeometryReader { geometry in
      ZStack {
        VStack {
          ScrollView(.horizontal, showsIndicators: false) {
            Text(piece.title)
              .font(.custom("Avigea", size: 25))
              .foregroundColor(Color("AccentColor"))
              .offset(x: offset, y: 0)
              .onAppear {
                withAnimation(
                  Animation.linear(duration: 7)
                    .repeatForever(autoreverses: false)) {
                  self.offset = -geometry.size.width*2
                }
              }
          }
          HStack {
            Spacer()
            Text(piece.composer)
              .font(.custom("Avigea", size: 20))
              .foregroundColor(Color("AccentColor"))
              .padding(.trailing)
          }
          HStack(spacing: 35) {
            Button {
              player.seek(to: .zero)
              player.pause()
            } label: {
              ButtonView(imageState: "stop.circle.fill")
            }
            Button {
              isPlaying.toggle()
              if isPlaying {
                player.play()
              } else {
                player.pause()
              }
            } label: {
              isPlaying ? ButtonView(imageState: "pause.circle.fill") : ButtonView(imageState: "play.circle.fill")
            }
            Button {
              player.seek(to: .zero)
            } label: {
              ButtonView(imageState: "arrowshape.turn.up.left.circle.fill")
            }
          }
          .offset(x: geometry.size.width/8)
        }
        .frame(width: geometry.size.width-60, height: 125)
        .background(LinearGradient(gradient: Gradient(colors: [Color("PageBackground"), Color.yellow]), startPoint: .leading, endPoint: .trailing))
        .overlay(
          Rectangle()
            .stroke(LinearGradient(gradient: Gradient(colors: [Color("PageBackground"), Color("AccentColor")]), startPoint: .leading, endPoint: .trailing), lineWidth: 5))
        .offset(x: 10)
        HStack() {
          Image(piece.composer)
            .resizable()
            .scaledToFill()
            .frame(width: 135, height: 135)
            .clipped()
            .clipShape(Circle())
            .overlay(
              Circle()
                .stroke(Color("AccentColor"), lineWidth: 5))
            .onAppear {
              let url = Bundle.main.url(forResource: piece.title, withExtension: "mp3")!
              let playerItem = AVPlayerItem(url: url)
              player.replaceCurrentItem(with: playerItem)
            }
          Spacer()
        }
      }
      .padding()
    }
  }
}
