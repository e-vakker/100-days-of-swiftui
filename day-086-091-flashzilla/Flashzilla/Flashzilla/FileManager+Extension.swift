//
//  FileManager+Extension.swift
//  Flashzilla
//
//  Created by Jevgeni Vakker on 26.09.2023.
//

import Foundation

extension FileManager {
    static var documentDirectory: URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[0].appendingPathComponent("SavedData.json")
    }
}
