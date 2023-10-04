//
//  FileManager+Extension.swift
//  RollDice
//
//  Created by Jevgeni Vakker on 29.09.2023.
//

import Foundation

extension FileManager {
    static var documentDirectoryFileURL: URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[0].appendingPathComponent("SavedHistory.json")
    }
}
