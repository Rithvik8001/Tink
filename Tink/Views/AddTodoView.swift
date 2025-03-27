
import SwiftUI

struct AddTodoView: View {
	
	@EnvironmentObject var listViewModel: ListViewModel
	@Environment(\.dismiss) var dismiss
	@State var todoInput: String = ""
	
	var body: some View {
		NavigationStack {
			ScrollView {
				VStack {
					TextField("Type your todo..", text: $todoInput)
						.padding(.horizontal)
						.frame(height: 55)
						.background(.gray.opacity(0.16))
						.cornerRadius(12)
						.padding(.horizontal)
					Button {
						listViewModel.addTodo(title: todoInput)
						dismiss()
					} label: {
						Text("Add Todo")
							.padding(20)
							.frame(maxWidth: .infinity)
							.background(.black)
							.foregroundStyle(.white)
							.cornerRadius(12)
							.padding(.horizontal)
							.padding(.vertical,4)
							.bold()
					}
					
				}
				.frame(maxWidth: .infinity,maxHeight: .infinity)
			}
			.navigationTitle("Add Todos")
		}
	}

}

#Preview {
	NavigationStack {
		AddTodoView()
	}
	.environmentObject(ListViewModel())
}
