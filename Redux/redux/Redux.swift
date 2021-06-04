//
//  Redux.swift
//  Redux
//
//  Created by Vandilson Lima on 16/04/21.
//

import Foundation
import Combine
import SwiftUI

typealias Reducer<State, Action> = (State, Action) -> State?
typealias AsyncAction<State, Action> = (State, @escaping (Action) -> Void) -> Void

final class Store<State, Action>: ObservableObject {
	@Published private(set) var state: State
	
	private let reducer: Reducer<State, Action>
	
	init(state: State, reducer: @escaping Reducer<State, Action> ) {
		self.state = state
		self.reducer = reducer
	}
	
	func dispatch(_ action: Action) {
		if let newState = reducer(state, action) {
			state = newState
		}
	}
	
	func dispatch(_ action: AsyncAction<State, Action>) {
		action(state) { self.dispatch($0) }
	}
	
	func derived<DerivedState, ExtractedAction>(
		_ deriveState: @escaping (State) -> DerivedState,
		with embedAction: @escaping (ExtractedAction) -> Action
	) -> Store<DerivedState, ExtractedAction> {
		
		let store = Store<DerivedState, ExtractedAction>(
			state: deriveState(state),
			reducer: { newState, newAction in
				self.dispatch(embedAction(newAction))
				return nil
			}
		)
		
		$state
			.map(deriveState)
			.receive(on: DispatchQueue.main)
			.assign(to: &store.$state)
		
		return store
	}
}

struct StoreSubscriberView<S, Content: View>: View {
	@State var state: S
	
	let publisher: AnyPublisher<S, Never>
	let content: (S) -> Content
	
	public var body: some View {
		content(state)
			.onReceive(publisher) { output in
				self.state = output
			}
	}
}

extension Store {	
	func subscribe<ViewState, Content: View>(
		transform: @escaping (State) -> ViewState,
		@ViewBuilder content: @escaping (ViewState) -> Content
	) -> StoreSubscriberView<ViewState, Content> {
		StoreSubscriberView(
			state: transform(state),
			publisher: $state.map(transform).eraseToAnyPublisher(),
			content: content
		)
	}
	
	func subscribe<Content: View>(
		@ViewBuilder content: @escaping (State) -> Content
	) -> StoreSubscriberView<State, Content> {
		StoreSubscriberView(
			state: state,
			publisher: $state.eraseToAnyPublisher(),
			content: content
		)
	}
}


