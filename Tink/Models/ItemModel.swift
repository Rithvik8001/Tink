
import Foundation


struct ItemModel: Identifiable {
	let id: String
	let title: String
	let isCompleted: Bool

	init(title: String, isCompleted: Bool, id: String = UUID().uuidString) {
		self.title = title
		self.isCompleted = isCompleted
		self.id = id
	}
	
	func updateCompletion() -> ItemModel {
		return ItemModel(title: title, isCompleted: !isCompleted, id: id)
	}
}
