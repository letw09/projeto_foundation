//
//  PecaImagemView.swift
//  FoundationFinalProject
//
//  Created by Found on 27/11/26.
//

import SwiftUI

struct PecaImagemView: View {
    let url: URL

    @State private var escala: CGFloat = 1
    @State private var ultimaEscala: CGFloat = 1
    @State private var deslocamento: CGSize = .zero
    @State private var ultimoDeslocamento: CGSize = .zero

    private let escalaMaxima: CGFloat = 4

    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView()

            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .scaleEffect(escala)
                    .offset(deslocamento)
                    .gesture(gestoDeZoom)
                    .simultaneousGesture(gestoDeArraste)
                    .onTapGesture(count: 2) {
                        alternarZoom()
                    }

            case .failure:
                ContentUnavailableView(
                    "Imagem indisponível",
                    systemImage: "photo",
                    description: Text("Não foi possível carregar esta foto.")
                )

            @unknown default:
                EmptyView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
        .navigationTitle("Peça")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                ShareLink(item: url)
            }
        }
    }

    private var gestoDeZoom: some Gesture {
        MagnificationGesture()
            .onChanged { valor in
                escala = min(max(ultimaEscala * valor, 1), escalaMaxima)
            }
            .onEnded { _ in
                ultimaEscala = escala
                if escala == 1 {
                    deslocamento = .zero
                    ultimoDeslocamento = .zero
                }
            }
    }

    private var gestoDeArraste: some Gesture {
        DragGesture()
            .onChanged { valor in
                guard escala > 1 else { return }
                deslocamento = CGSize(
                    width: ultimoDeslocamento.width + valor.translation.width,
                    height: ultimoDeslocamento.height + valor.translation.height
                )
            }
            .onEnded { _ in
                ultimoDeslocamento = deslocamento
            }
    }

    private func alternarZoom() {
        withAnimation(.smooth) {
            if escala > 1 {
                escala = 1
                ultimaEscala = 1
                deslocamento = .zero
                ultimoDeslocamento = .zero
            } else {
                escala = 2
                ultimaEscala = 2
            }
        }
    }
}

#Preview {
    NavigationStack {
        PecaImagemView(url: URL(string: "https://picsum.photos/id/21/800")!)
    }
}
