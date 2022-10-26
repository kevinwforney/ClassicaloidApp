//
//  ContentView.swift
//  Classicaloid
//
//  Created by User15 on 10/22/22.
//

import SwiftUI
import AVKit

extension Text {
    func AppHeaderStyle() -> some View {
        self
          .font(.custom("Avigea", size: 35))
          .padding(.top, 30)
          .foregroundColor(Color("AccentColor"))
    }
}

struct ContentView: View {
  init() {
    UITabBar.appearance().barTintColor = .init(Color("TabBarBackground"))
  }
  @State var PopUp = false
  @State private var player = AVPlayer(url: Bundle.main.url(forResource: "DuhDuhDuhDum", withExtension: "mp4")!)
    var body: some View {
      TabView {
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
              VStack {
                VideoPlayer(player: player)
                  .onDisappear {
                    player.pause()
                  }
                ZStack {
                  if PopUp {
                    PopUpView(width: geometry.size.width/5, height: geometry.size.height/5)
                      .offset(y: -geometry.size.height/7)
                  }
                  ZStack {
                    Circle()
                       .foregroundColor(Color("TabBarBackground"))
                       .frame(width: geometry.size.width/3-10, height: geometry.size.width/3-10)
                      .overlay(Circle().stroke(Color("AccentColor"), lineWidth: 6))
                    Image(systemName: "rays")
                      .resizable()
                      .aspectRatio(contentMode: .fit)
                      .frame(width: geometry.size.width/3-40, height: geometry.size.width/3-40)
                      .foregroundColor(Color("AccentColor"))
                      .rotationEffect(Angle(degrees: PopUp ? 90 : 0))
                  }
                  .onTapGesture {
                    withAnimation{
                      PopUp.toggle()
                    }
                  }
                }
                .frame(width: geometry.size.width, height: geometry.size.height/2)
              }
            }
          }
        }
        .edgesIgnoringSafeArea(.all)
        .tabItem { Label("Home", systemImage: "music.note.house") }
        EraTabView()
          .tabItem { Label("Era", systemImage: "calendar") }
        ComposerTabView()
          .tabItem { Label("Composer", systemImage: "person") }
        PieceTabView(piece: .previewPiece)
          .tabItem { Label("Piece", systemImage: "music.quarternote.3") }
        }
      .tabViewStyle(DefaultTabViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView().preferredColorScheme(.dark)
    }
}

struct PopUpView: View {
  let width: CGFloat
  let height: CGFloat

  var body: some View {
    HStack(spacing: 35) {
      Link(destination: URL(string: "https://en.wikipedia.org/wiki/Classical_music")!, label: {
        ZStack {
          Circle()
            .foregroundColor(Color("TabBarBackground"))
            .frame(width: width, height: height)
            .overlay(Circle().stroke(Color("AccentColor"), lineWidth: 5))
            .shadow(radius: 5)
          Image(systemName: "link")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(15)
            .frame(width: width, height: height)
            .foregroundColor(Color("AccentColor"))
        }
      })
      Link(destination: URL(string: "https://zh.wikipedia.org/wiki/%E5%8F%A4%E5%85%B8%E9%9F%B3%E4%B9%90")!, label: {
        ZStack {
          Circle()
            .foregroundColor(Color("TabBarBackground"))
            .frame(width: width, height: height)
            .overlay(Circle().stroke(Color("AccentColor"), lineWidth: 5))
            .shadow(radius: 5)
          Image(systemName: "link")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(15)
            .frame(width: width, height: height)
            .foregroundColor(Color("AccentColor"))
        }
      })
    }
    .transition(.scale)
  }
}
