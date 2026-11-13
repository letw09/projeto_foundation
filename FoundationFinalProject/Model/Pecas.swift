//
//  Pecas.swift
//  FoundationFinalProject
//
//  Created by Found on 13/11/26.
//
import SwiftUI
import Notion

@NotionPage
struct NotionPecas: Identifiable {
    @NotionTitleProperty("Nome da Peça") var nomePecas: String
    @NotionProperty("Imagem da Peça") var imagePecas: URL?
    @NotionProperty("Tipo") var tipo: Tipo?

}


enum Tipo: String {
    case vestidoSaias
    case blusas
    case calcaShorts
    case jaquetasCasacos
    case acessorios
    case calcados
}
