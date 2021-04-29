//
//  ContentView.swift
//  LifeCounter2
//
//  Created by Ryan Lee on 4/28/21.
//

import SwiftUI
import Combine

struct Player: Identifiable {
    var id: Int
    var playerName: String
    var hp: Int = 20
}


struct Change: Hashable {
    var log: String
}

struct ContentView: View {
    
    @State private var numPlayers: Int = 4
    @State private var gameStarted: Bool = false
    @State private var changes: [Change] = []

    
    func addPlayer() {
        numPlayers += 1
        players.append(Player(id: numPlayers - 1, playerName: "Player \(numPlayers)"))
    }
    
    @State private var players: [Player] = [
        .init(id: 0, playerName: "Player 1"),
        .init(id: 1, playerName: "Player 2"),
        .init(id: 2, playerName: "Player 3"),
        .init(id: 3, playerName: "Player 4")
    ]
    
    @State private var stupidChangeLog: Int = 0
    
    
    var body: some View {
        NavigationView {
            VStack() {
                HStack {
                    NavigationLink(
                        destination:
                            HistoryView(list: $changes)) {
                        Text("History")
                            .padding()
                            .accentColor(Color.purple)
                            .border(Color.purple)
                    }.frame(maxWidth: .infinity)
                    Button {
                        addPlayer()
                    } label: {
                        Text("Add Player")
                            .frame(width: 140, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(Color.green)
                            .accentColor(Color.white)
                            .cornerRadius(10)
                    }.disabled(numPlayers == 8 || gameStarted)
                    .frame(maxWidth: .infinity)
                }
                ScrollView() {
                    ForEach(players) {
                        PlayerControlsView(playerName: $0.playerName, hp: $0.hp, changes: $changes, numPlayers: $numPlayers, gameStarted: $gameStarted).padding()
                    }
                }
            }

        }
    }
}

struct HistoryView: View {
    @Binding var list: [Change]
    
    var body: some View {
        ScrollView() {
            ForEach(list, id: \.self) { item in
                Text(item.log).padding()
            }
        }
    }
}

struct PlayerControlsView: View {
    
    @State var playerName: String
    @State var hp: Int
    @State var hpModifier: String = ""
    @Binding var changes: [Change]
    @Binding var numPlayers: Int
    @Binding var gameStarted: Bool
    
    func playerLost(_ hp: Int, _ name: String) {
        if hp <= 0 && numPlayers > 1 {
            numPlayers -= 1
            changes.append(Change(log: "\(name) lost the game. \(numPlayers) remaining"))
        }
    }
    
    var body: some View {
        VStack() {
            Text(playerName)
            TextField("HP", text: $hpModifier)
                .keyboardType(.numberPad)
                .onReceive(Just(hpModifier)) { newValue in
                    let filtered = newValue.filter { "0123456789".contains($0) }
                    if filtered != newValue {
                        self.hpModifier = filtered
                    }
            }
            HStack() {
                Button {
                    self.hp -= Int(hpModifier)!
                    changes.append(Change(log: "\(self.playerName) lost \(self.hpModifier) HP."))
                    playerLost(self.hp, self.playerName)
                    gameStarted = true
                } label: {
                    Text("-\(hpModifier)")
                }.frame(maxWidth: .infinity)
                .disabled(hpModifier == "")
                Button {
                    self.hp -= 1
                    changes.append(Change(log: "\(self.playerName) lost 1 HP."))
                    playerLost(self.hp, self.playerName)
                    gameStarted = true
                } label: {
                    Text("-1")
                }.frame(maxWidth: .infinity)

                Text("\(hp) HP").frame(maxWidth: .infinity)
                Button {
                    self.hp += 1
                    changes.append(Change(log: "\(self.playerName) gained 1 HP."))
                    gameStarted = true
                } label: {
                    Text("+1")
                }.frame(maxWidth: .infinity)
                Button {
                    self.hp += Int(hpModifier)!
                    changes.append(Change(log: "\(self.playerName) gained \(self.hpModifier) HP."))
                    gameStarted = true
                } label: {
                    Text("+\(hpModifier)")
                }.frame(maxWidth: .infinity)
                .disabled(hpModifier == "")
            }
        }.disabled(self.hp <= 0)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}
#endif
