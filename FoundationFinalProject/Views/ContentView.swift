import SwiftUI
import Notion

struct ContentView: View {
    
    @State var estilos: [NotionEstilos] = []
    
    let bearerToken = ProcessInfo.processInfo.environment["BEARER_TOKEN"]!
    
    var body: some View {
        
       
        NavigationStack {
            ScrollView {
                Text(" ")
                Text("Estilos")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], spacing: 16) {
                    ForEach(estilos) { estilo in
                        NavigationLink {
                            EstiloDetailView(estilo: estilo)
                        } label: {
                            EstiloRowView(estilo: estilo)
                        }
                        .buttonStyle(.automatic)
                    }
                }
                .padding()
            }
            .task {
                do {
                    let client = NotionClient(
                        bearerToken: bearerToken
                    )
                    self.estilos = try await client.fetchPages(ofType: NotionEstilos.self)
                } catch {
                    print(error)
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}
