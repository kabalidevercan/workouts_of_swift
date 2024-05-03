import SwiftUI

struct EditView: View {
    
    enum LoadingState {
        case loading, loaded, failed
    }
    
    var onSave: (Location) -> Void
    
    @Environment(\.dismiss) var dismiss
    
    var location: Location
    @State private var name: String
    @State private var description: String
    @State private var loadingState = LoadingState.loading
    @State private var pages = [Page]()
    
    init(location: Location, onSave: @escaping (Location) -> Void) {
        self.location = location
        self.onSave = onSave
        
        _name = State(initialValue: location.name)
        _description = State(initialValue: location.description)
    }
    
    var body: some View {
        NavigationStack {
            formView
                .navigationTitle("Place Details")
                .toolbar {
                    saveButton
                }
                .task {
                    await fetchNearbyPlaces()
                }
        }
    }
    
    private var formView: some View {
        Form {
            Section("Section one") {
                TextField("Place name", text: $name)
                TextField("Description", text: $description)
            }
            nearbySection
        }
    }
    
    private var nearbySection: some View {
        Section("Nearby…") {
            switch loadingState {
            case .loaded:
                ForEach(pages, id: \.pageId) { page in
                    Text(page.title)
                        .font(.headline) + Text(": ") + Text(page.description)
                            .italic()
                }
            case .loading:
                Text("Loading…")
            case .failed:
                Text("Please try again later.")
            }
        }
    }
    
    private var saveButton: some View {
        Button("Save") {
            var newLocation = location
            newLocation.id = UUID()
            newLocation.name = name
            newLocation.description = description
            
            onSave(newLocation)
            dismiss()
        }
    }
    
    
    //53.39585319388768 ve -2.9329864403386074
    private func fetchNearbyPlaces() async {
        let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(location.latitude)%7C\(location.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"
        
        guard let url = URL(string: urlString) else {
            print("Bad URL: \(urlString)")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // we got some data back!
            let items = try JSONDecoder().decode(Result.self, from: data)
            
            // success – convert the array values to our pages array
            pages = items.query.pages.values.sorted()
            loadingState = .loaded
        } catch {
            // if we're still here it means the request failed somehow
            loadingState = .failed
        }
    }
}
