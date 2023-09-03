//
//  FileManager+Extensions.swift
//  MemPix
//
//  Created by Jevgeni Vakker on 03.09.2023.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
