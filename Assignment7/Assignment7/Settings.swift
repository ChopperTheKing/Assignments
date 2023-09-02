//
//  Settings.swift
//  Assignment7
//
//  Created by Ronnie Kissos on 8/31/23.
//

import Foundation

struct Settings {
    var name: String
    var imageName: String
    var subtitle: String?
    var hasSwitch: Bool
    init(name: String, imageName: String, subtitle: String? = nil, hasSwitch: Bool = false) {
        self.name = name
        self.imageName = imageName
        self.subtitle = subtitle
        self.hasSwitch = hasSwitch
    }
}
