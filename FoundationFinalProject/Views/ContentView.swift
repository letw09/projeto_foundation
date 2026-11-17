import SwiftUI
import Notion

struct ContentView: View {
    
    @State var estilos: [NotionEstilos] = []
    
    
    let bearerToken = ProcessInfo.processInfo.environment["BEARER_TOKEN"]!
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .task {
            let client = NotionClient(
                bearerToken: bearerToken
            )
        }
    }
}

#Preview {
    ContentView()
}
