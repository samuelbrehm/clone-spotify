//
//  NewReleasesResponse.swift
//  SpotifyClone
//
//  Created by Samuel Brehm on 27/10/21.
//

import Foundation

// MARK: - NewReleasesResponse
struct NewReleasesResponse: Codable {
    var albums: AlbumsResponse
}

// MARK: - AlbumsResponse
struct AlbumsResponse: Codable {
    let items: [Album]
}

// MARK: - Album
struct Album: Codable {
    let album_type: String
    let available_markets: [String]
    let id: String
    let images: [APIImage]
    let name: String
    let release_tracks: String
    let total_tracks: Int
    let artists: [Artist]
}
