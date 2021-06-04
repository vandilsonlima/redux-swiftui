//
//  Model.swift
//  Redux
//
//  Created by Vandilson Lima on 17/04/21.
//

import Foundation

struct Song: Identifiable {
	let id: UUID
	let name: String
}

struct Album: Identifiable {
	let id: UUID
	let name: String
	let songs: [Song]
}

struct Artist: Identifiable {
	let id: UUID
	let name: String
	let albums: [Album]
}

extension Artist {
	func changing(id: UUID? = nil, name: String? = nil, albums: [Album]? = nil) -> Artist {
		Artist(id: id ?? self.id, name: name ?? self.name, albums: albums ?? self.albums)
	}
}
