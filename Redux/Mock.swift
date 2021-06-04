//
//  Mock.swift
//  Redux
//
//  Created by Vandilson Lima on 17/04/21.
//

import Foundation

struct Mock {
    static let artists = [
			Artist(id: UUID(), name: "Arctic Monkeys", albums: [
            Album(id: UUID(), name: "AM", songs: [
                Song(id: UUID(), name: "Do I Wanna Know?"),
                Song(id: UUID(), name: "R U Mine?"),
                Song(id: UUID(), name: "One for the Road"),
                Song(id: UUID(), name: "Arabella"),
                Song(id: UUID(), name: "I Want It All"),
                Song(id: UUID(), name: "No.1 Party Anthem"),
                Song(id: UUID(), name: "Mad Sounds"),
                Song(id: UUID(), name: "Fireside"),
                Song(id: UUID(), name: "Why'd You Only Call Me When You're High?"),
                Song(id: UUID(), name: "Snap Out of It"),
                Song(id: UUID(), name: "Knee Socks"),
                Song(id: UUID(), name: "I Wanna Be Yours")
            ])
        ]),
			Artist(id: UUID(), name: "Pink Floyd", albums: [
					Album(id: UUID(), name: "The Dark Side of the Moon", songs: [
							Song(id: UUID(), name: "Speak to Me"),
							Song(id: UUID(), name: "Breathe(In the Air)"),
							Song(id: UUID(), name: "On the Run"),
							Song(id: UUID(), name: "Time"),
							Song(id: UUID(), name: "The Great Gig in the Sky"),
							Song(id: UUID(), name: "Money"),
							Song(id: UUID(), name: "Us and Them"),
							Song(id: UUID(), name: "Any Colour you like"),
							Song(id: UUID(), name: "Brain Damage"),
							Song(id: UUID(), name: "Eclipse"),
					])
			]),
    ]
}
