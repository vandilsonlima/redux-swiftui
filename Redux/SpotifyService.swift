//
//  SpotifyService.swift
//  Redux
//
//  Created by Vandilson Lima on 17/04/21.
//

import Foundation
import Combine

final class SpotifyService {
	static let shared = SpotifyService()
	
	func fetch() -> Future<[Artist], Error> {
		Future { attemptToFufill in
			DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
				attemptToFufill(.success(Mock.artists))
			}
		}
	}
}
