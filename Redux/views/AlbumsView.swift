//
//  AlbumsView.swift
//  Redux
//
//  Created by Vandilson Lima on 17/04/21.
//

import SwiftUI

struct AlbumsView: View {
	@EnvironmentObject private var store: LibraryStore
	
	let artistId: UUID
	
	var body: some View {
		store.subscribe(transform: stateToArtist) { artist in
			List {
				ForEach(artist.albums) {
					NavigationLink($0.name, destination: SongsView(albumId: $0.id, artistId: artist.id))
				}
				.onDelete(perform: delete)
			}
			.navigationTitle(artist.name)
		}
	}
	
	private func stateToArtist(_ state: LibraryState) -> Artist {
		return state.artists.first { $0.id == self.artistId }!
	}
	
	private func delete(at indexSet: IndexSet) {
		let artist = stateToArtist(store.state)
		
		indexSet.forEach {
			let album = artist.albums[$0]
			store.dispatch(.deleteAlbum(artistId: artistId, albumId: album.id))
		}
	}
}
