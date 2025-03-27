
import SwiftUI

struct ListView: View {
	@EnvironmentObject var listViewModel: ListViewModel
	var body: some View {
		NavigationStack {
			List {
				ForEach(listViewModel.todoItems) { item in
					ListRowView(todoItem: item)
						.onTapGesture {
							withAnimation(.linear) {
								listViewModel.updateTodo(item: item)
							}
						}
				}
				.onDelete { IndexSet in
					listViewModel.deleteTodo(indexSet: IndexSet)
				}
				.onMove { IndexSet, Int in
					listViewModel.moveTodo(from: IndexSet, to: Int)
				}
			}
			.listStyle(InsetGroupedListStyle())
			.navigationTitle("Todos")
			.navigationBarItems(
				leading: EditButton(),
				trailing: NavigationLink("Add", destination: AddTodoView()))
		}
	}
}

#Preview {
	NavigationStack {
		ListView()
	}
	.environmentObject(ListViewModel())
}
