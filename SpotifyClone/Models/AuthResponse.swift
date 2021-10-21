//
//  AuthResponse.swift
//  SpotifyClone
//
//  Created by Samuel Brehm on 21/10/21.
//

import Foundation

struct AuthResponse: Codable {
    let access_token: String
    let expires_in: Int
    let refresh_token: String?
    let scope: String
    let token_type: String
}
