//
//  ItemModel.swift
//  Tink
//
//  Created by Rithvik Pallamreddy on 3/27/25.
//

import Foundation


struct ItemModel: Identifiable {
	let id: String = UUID().uuidString
	let title: String
	let isCompleted: Bool
}
