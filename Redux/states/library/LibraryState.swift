//
//  LibraryState.swift
//  Redux
//
//  Created by Vandilson Lima on 17/04/21.
//

import Foundation

typealias LibraryStore = Store<LibraryState, LibraryAction>
typealias LibraryAsync = AsyncAction<LibraryState, LibraryAction>

struct LibraryState {
	let artists: [Artist]
	let isLoading: Bool
}

