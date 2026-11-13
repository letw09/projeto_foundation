//
//  Estilos.swift
//  FoundationFinalProject
//
//  Created by Found on 13/11/26.
//

import SwiftUI
import Notion

@NotionPage
struct NotionEstilos: Identifiable{
    @NotionTitleProperty("Nome do Estilo") var nome: String
    @NotionProperty("Referência") var referencia: URL?
    @NotionRelationProperty("Peças do estilo") var pecas: [NotionPecas]
}
