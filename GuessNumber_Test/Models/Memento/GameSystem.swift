//
//  GameSystem.swift
//  GuessNumber_Test
//
//  Created by Georgiy Groshev on 18.12.2022.
//

import Foundation

class GameSystem {
    
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    private let userDefaults = UserDefaults.standard
    
    public func save(_ game: GameModel, title: String) throws {
        
        let data = try encoder.encode(game)
        userDefaults.set(data, forKey: title)
    }
    public func load(_ title: String) throws -> GameModel {
        
        guard let data = userDefaults.data(forKey: title),
              let game = try? decoder.decode(GameModel.self, from: data) else {
            throw Error.gameNotFound
        }

        return game
    }
    public enum Error: String, Swift.Error {
        
        case gameNotFound
    }
}
