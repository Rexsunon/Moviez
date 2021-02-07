//
//  MoviezSliderView.swift
//  Moviez
//
//  Created by Evidence Osikhena on 07/02/2021.
//

import SwiftUI
import SwiftUIPager

struct MoviezSliderView: View {
    @Binding var moviez: [Moviez]
    @StateObject var pageIndex: Page = .first()
    var body: some View {
        Pager(page: self.pageIndex, data: self.moviez, id: \.name) { movie in
//            MoviezView(movie: movie)
        }
        .ignoresSafeArea()
    }
}

struct MoviezSliderView_Previews: PreviewProvider {
    static var previews: some View {
        MoviezSliderView(moviez: .constant(Moviez.data))
    }
}
