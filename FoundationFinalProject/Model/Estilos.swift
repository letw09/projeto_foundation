//
//  Estilos.swift
//  FoundationFinalProject
//
//  Created by Found on 13/11/26.
//

import SwiftUI
import Notion

@NotionPage("Estilos")
struct NotionEstilos: Identifiable{
    @NotionTitleProperty("Nome do Estilo") var nome: String
    @NotionProperty("Descrição") var descricao: String
    @NotionProperty("Referencia") var referencia: URL?
    @NotionRelationProperty("Peça") var pecas: [NotionPecas]
    
}
struct Estilos: Identifiable {
    let id = UUID()
    let nome: String
    let descricao: String
    let referencia: ImageResource
    let pecas: [NotionPecas]
}
