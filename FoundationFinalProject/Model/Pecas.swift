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
    @NotionTitleProperty("Nome") var nomePecas: String
    @NotionProperty("Imagem") var imagePecas: URL?
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
