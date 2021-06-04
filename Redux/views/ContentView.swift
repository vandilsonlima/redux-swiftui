//
//  ContentView.swift
//  Redux
//
//  Created by Vandilson Lima on 16/04/21.
//

import SwiftUI

private let store = AppStore(
	state: AppState(library: LibraryState(artists: [], isLoading: false)),
	reducer: appReducer
)

private let libraryStore = store.derived(\.library, with: { AppAction.library($0)} )

struct ContentView: View {
	
	var body: some View {
		NavigationView {
			ArtirstsView()
				.environmentObject(libraryStore)
		}
		.onAppear(perform: load)
	}
	
	func load() {
		libraryStore.dispatch(fetchArtists)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
