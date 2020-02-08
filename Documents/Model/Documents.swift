//
//  Documents.swift
//  Documents
//
//  Created by Jasmine Tan on 2/1/20.
//  Copyright © 2020 Jasmine Tan. All rights reserved.
//

import Foundation

func get() -> [Document] {
        var documents = [Document]()
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        if let urls = try? FileManager.default.contentsOfDirectory(at: documentsURL, includingPropertiesForKeys: nil) {
            for url in urls {
                let name = url.lastPathComponent
                if let attributes = try? FileManager.default.attributesOfItem(atPath: url.path),
                    let size = attributes[FileAttributeKey.size] as? UInt64,
                    let modificationDate = attributes[FileAttributeKey.modificationDate] as? Date {
                    documents.append(Document(url: url, name: name, size: size, modified: modificationDate))
                }
            }
        }
        
        return documents
    }
    
func delete(url: URL) {
        try? FileManager.default.removeItem(at: url)
    }
    
func save(name: String, content: String) {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let url = documentsURL.appendingPathComponent(name)

        try? content.write(to: url, atomically: true, encoding: .utf8)
    }

