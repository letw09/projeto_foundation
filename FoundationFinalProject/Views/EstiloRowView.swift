import SwiftUI
import Notion

struct EstiloRowView: View {
    let estilo: NotionEstilos
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
                EstiloCover(cover: estilo.referencia)
                Text(estilo.nome)
                .font(.footnote)
                .fontWeight(.regular)
                
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
                }
                    
                }
        
