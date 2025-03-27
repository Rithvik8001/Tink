//
//  ListViewModel.swift
//  Tink
//
//  Created by Rithvik Pallamreddy on 3/27/25.
//

import Foundation

class ListViewModel: ObservableObject {
	@Published var todoItems: [ItemModel] = []
	
	init() {
		getItems()
	}
	
	func getItems() {
		let newItems = [
			ItemModel(title: "This is the first todo", isCompleted: false),
			ItemModel(title: "This is the second todo", isCompleted: false),
			ItemModel(title: "This is the third todo", isCompleted: true),
			ItemModel(title: "This is the fourth todo", isCompleted: false),
			ItemModel(title: "This is the fifth todo", isCompleted: false),
		]
		todoItems.append(contentsOf: newItems)
	}
	
	func deleteTodo(indexSet: IndexSet) {
		todoItems.remove(atOffsets: indexSet)
	}
	
	func moveTodo(from: IndexSet, to: Int) {
		todoItems.move(fromOffsets: from, toOffset: to)
	}
	func addTodo(title: String) {
		let newTodo = ItemModel(title: title, isCompleted: false)
		todoItems.append(newTodo)
	}
	func updateTodo(item: ItemModel) {
//		get the index where we swiped/clicked on.
//		first index is unique because every element in the array is unique
		
		if let index = todoItems.firstIndex(where: {$0.id == item.id}) {
			todoItems[index] = item.updateCompletion()
		}
	}
}
