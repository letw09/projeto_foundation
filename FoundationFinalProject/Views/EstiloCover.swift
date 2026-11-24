import SwiftUI
import Notion

struct EstiloCover: View
{
    let cover: URL?

    var body: some View {
        AsyncImage(url: cover)
        { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: 150, height: 150)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .clipped()
            case .failure:
                Image(systemName: "photo")
                    .font(.title2)
                    .foregroundStyle(.secondary)
                    .frame(width: 150, height: 150)
            @unknown default:
                EmptyView()
                    .frame(width: 150, height: 150)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .frame(maxWidth: .infinity, alignment: .center)

        }
    }



