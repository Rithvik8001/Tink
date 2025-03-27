
import SwiftUI

struct ListView: View {
	@State var items: [String] = [
		"This is First Todo",
		"This is Second Todo",
		"This is Third Todo",
		"This is Fourth Todo",
		"This is Fifth Todo",
	]
	var body: some View {
		NavigationStack {
			List {
				ForEach(items, id: \.self) { item in
					ListRowView(title: item)
				}
			}
			.listStyle(InsetGroupedListStyle())
			.navigationTitle("Todos")
			.navigationBarItems(
				leading: EditButton(),
				trailing: NavigationLink("Add", destination: AddTodoView()) )
		}
	}
}

#Preview {
	ListView()
}
