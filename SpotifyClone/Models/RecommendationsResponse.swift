//
//  RecommendationsResponse.swift
//  SpotifyClone
//
//  Created by Samuel Brehm on 09/11/21.
//

import Foundation

struct RecommendationsResponse: Codable {
    let tracks: [AudioTrack]
}

