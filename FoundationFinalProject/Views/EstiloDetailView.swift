import SwiftUI
import Notion

struct EstiloDetailView: View {
    let estilo: NotionEstilos
    @State private var imagens: [URL]

    init(estilo: NotionEstilos) {
        self.estilo = estilo
        _imagens = State(initialValue: estilo.pecas.flatMap(\.imagePecas).shuffled())
    }

    var body: some View {
        ScrollView {
            if imagens.isEmpty {
                ContentUnavailableView(
                    "Sem imagens",
                    systemImage: "photo",
                    description: Text("Este estilo ainda não tem fotos de peças cadastradas.")
                )
                .padding(.top, 40)
            } else {
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], spacing: 16) {
                    ForEach(imagens, id: \.self) { url in
                        ImagemPecaCard(url: url)
                    }
                }
                .padding()
            }
        }
        .navigationTitle(estilo.nome)
        .navigationBarTitleDisplayMode(.large)
        .task(id: estilo.id) {
            imagens = estilo.pecas.flatMap(\.imagePecas).shuffled()
        }
    }
}

private struct ImagemPecaCard: View {
    let url: URL
    private let tamanho: CGFloat = 150
    
    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: tamanho, height: tamanho)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: tamanho, height: tamanho)
                    .clipped()
            case .failure:
                Image(systemName: "photo")
                    .font(.title2)
                    .foregroundStyle(.secondary)
                    .frame(width: tamanho, height: tamanho)
            @unknown default:
                EmptyView()
                    .frame(width: tamanho, height: tamanho)
            }
        }
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .frame(maxWidth: .infinity, alignment: .center)
    }
}
    
