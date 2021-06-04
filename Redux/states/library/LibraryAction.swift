//
//  LibraryAction.swift
//  Redux
//
//  Created by Vandilson Lima on 23/04/21.
//

import Foundation
import Combine

enum LibraryAction {
	case setArtists([Artist])
	case deleteArtist(artistId: UUID)
	case deleteAlbum(artistId: UUID, albumId: UUID)
	
	case loading(Bool)
}

let fetchArtists: LibraryAsync = { state, dispatch in
	dispatch(.loading(true))
	let future = SpotifyService.shared.fetch()

	var subscription: AnyCancellable!
	
	subscription = future
		.receive(on: DispatchQueue.main)
		.sink { completion in
			dispatch(.loading(false))
			if case .failure(let err) = completion {
				print(err.localizedDescription)
			}
			subscription.cancel()
		} receiveValue: { artists in
			dispatch(.setArtists(artists))
		}
}
