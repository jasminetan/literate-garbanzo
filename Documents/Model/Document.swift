//
//  Document.swift
//  Documents
//
//  Created by Jasmine Tan on 2/1/20.
//  Copyright © 2020 Jasmine Tan. All rights reserved.
//

import Foundation

struct Document {
    let url: URL
    let name: String
    let size: UInt64
    let modified: Date
    var content: String? {
        get {
            return try? String(contentsOf: url, encoding: .utf8)
        }
    }
}
