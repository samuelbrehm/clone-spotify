//
//  Artist.swift
//  SpotifyClone
//
//  Created by Samuel Brehm on 19/10/21.
//

import Foundation

struct Artist: Codable {
    let id: String
    let name: String
    let type: String
    let external_urls: [String: String]
}
