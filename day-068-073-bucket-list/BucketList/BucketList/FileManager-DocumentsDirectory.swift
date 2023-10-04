//
//  FileManager-DocumentsDirectory.swift
//  BucketList
//
//  Created by Jevgeni Vakker on 23.08.2023.
//

import Foundation

extension FileManager {
    static var documentDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
