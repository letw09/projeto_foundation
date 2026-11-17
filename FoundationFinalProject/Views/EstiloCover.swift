import SwiftUI

struct EstiloCover: View {
    let cover: URL?
    var body: some View {
        AsyncImage(url: cover) {image in
            image
                .resizable()
                .frame(width: 100, height: 100)
        } placeholder: {
            ProgressView()
                .frame(width: 100, height: 100)
        }
    }}


