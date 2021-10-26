//
//  SettingsModels.swift
//  SpotifyClone
//
//  Created by Samuel Brehm on 26/10/21.
//

import Foundation

struct Section {
    let title: String
    let options: [Option]
}

struct Option {
    let title: String
    let handler: () -> Void
}
