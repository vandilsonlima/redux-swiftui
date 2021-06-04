//
//  LibraryReducer.swift
//  Redux
//
//  Created by Vandilson Lima on 23/04/21.
//

import Foundation

func libraryReducer(_ state: LibraryState, action: LibraryAction) -> LibraryState {
	switch action {
	case .setArtists(let artists):
		return LibraryState(artists: artists, isLoading: state.isLoading)
	case .deleteArtist(let artistId):
		return LibraryState(artists: state.artists.filter { $0.id != artistId }, isLoading: state.isLoading)
	case .deleteAlbum(let artistId, let albumId):
		return deleteAlbum(state, artistId, albumId)
	case .loading(let isLoading):
		return LibraryState(artists: state.artists, isLoading: isLoading)
	}
}

private func deleteAlbum(_ state: LibraryState, _ artistId: UUID, _ albumId: UUID) -> LibraryState {
	guard
		let index = state.artists.firstIndex(where: { $0.id == artistId})
	else { return state }
	
	let artirst = state.artists[index]
	
	var albums = artirst.albums
	albums.removeAll(where: { $0.id == albumId })
	
	var artists = state.artists
	artists[index] = artirst.changing(albums: albums)
	
	return LibraryState(artists: artists, isLoading: state.isLoading)
}
