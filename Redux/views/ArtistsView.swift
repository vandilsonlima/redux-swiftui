//
//  ArtirstsView.swift
//  Redux
//
//  Created by Vandilson Lima on 17/04/21.
//

import SwiftUI
import Combine

struct ArtirstsView: View {
	@EnvironmentObject private var store: LibraryStore
	
	private var loadingView: some View {
		ProgressView()
			.progressViewStyle(CircularProgressViewStyle())
	}
	
	private func listView(_ state: LibraryState) -> some View {
		List {
			ForEach(state.artists) {
				NavigationLink(
					$0.name,
					destination: AlbumsView(artistId: $0.id).environmentObject(store)
				)
			}
		}
		.navigationTitle("Artists")
	}
	
	var body: some View {
		store.subscribe { state in
			if state.isLoading {
				loadingView
			} else {
				listView(state)
			}
		}
	}
}
