//
//  SongsView.swift
//  Redux
//
//  Created by Vandilson Lima on 17/04/21.
//

import SwiftUI

private struct SongRow: View {
	let song: Song
	
	var body: some View {
		HStack {
			Text(song.name)
			Spacer()
			Image(systemName: "play")
		}
	}
}

struct SongsView: View {
	@EnvironmentObject private var store: LibraryStore
	
	let albumId: UUID
	let artistId: UUID
	
	var body: some View {
		store.subscribe(transform: stateToAlbum) { album in
			List {
				ForEach(album.songs) {
					SongRow(song: $0)
				}
			}
			.navigationTitle(album.name)
		}
	}
	
	private func stateToAlbum(_ state: LibraryState) -> Album {
		let artist = state.artists.filter({ $0.id == artistId }).first!
		let album = artist.albums.first(where: { $0.id == albumId})!
		return album
	}
}
