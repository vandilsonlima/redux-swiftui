//
//  AppState.swift
//  Redux
//
//  Created by Vandilson Lima on 17/04/21.
//

import Foundation

typealias AppStore = Store<AppState, AppAction>

struct AppState {
	let library: LibraryState
}

enum AppAction {
	case library(LibraryAction)
}

func appReducer(_ state: AppState, _ action: AppAction) -> AppState {
	switch action {
	case .library(let act):
		return AppState(library: libraryReducer(state.library, action: act))
	}
}
