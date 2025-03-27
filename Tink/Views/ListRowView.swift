import SwiftUI

struct ListRowView: View {
	
	let todoItem: ItemModel
	
	var body: some View {
		HStack {
			Image(systemName: todoItem.isCompleted ? "checkmark.circle" : "circle")
				.foregroundStyle(todoItem.isCompleted ? .green : .red)
			Spacer()
			Text(todoItem.title)
				.font(.headline)
				.foregroundStyle(.gray.opacity(2))
			Spacer()
		}
	}
}

#Preview {
	ListRowView(todoItem: ItemModel(title: "Todo Item", isCompleted: false))
}
