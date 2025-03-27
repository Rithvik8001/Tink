
import SwiftUI

@main
struct TinkApp: App {
	@StateObject var listViewModel: ListViewModel = ListViewModel()
	
    var body: some Scene {
        WindowGroup {
			NavigationStack {
				ListView()
			}
			.environmentObject(listViewModel)
        }
    }
}
