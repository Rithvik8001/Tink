
import SwiftUI

struct ListView: View {
	@State var items: [ItemModel] = [
		ItemModel(title: "This is the first todo", isCompleted: false),
		ItemModel(title: "This is the second todo", isCompleted: false),
		ItemModel(title: "This is the third todo", isCompleted: true),
		ItemModel(title: "This is the fourth todo", isCompleted: false),
		ItemModel(title: "This is the fifth todo", isCompleted: false),
	]
	var body: some View {
		NavigationStack {
			List {
				ForEach(items) { item in
					ListRowView(todoItem: item)
				}
				.onDelete { IndexSet in
					deleteTodo(indexSet: IndexSet)
				}
				.onMove { IndexSet, Int in
					moveTodo(from: IndexSet, to: Int)
				}
			}
			.listStyle(InsetGroupedListStyle())
			.navigationTitle("Todos")
			.navigationBarItems(
				leading: EditButton(),
				trailing: NavigationLink("Add", destination: AddTodoView()) )
		}
	}
	
	func deleteTodo(indexSet: IndexSet) {
		items.remove(atOffsets: indexSet)
	}
	
	func moveTodo(from: IndexSet, to: Int) {
		items.move(fromOffsets: from, toOffset: to)
	}
}

#Preview {
	ListView()
}
