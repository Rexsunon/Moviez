//
//  MovieDetailsView.swift
//  Moviez
//
//  Created by Evidence Osikhena on 26/01/2021.
//

import SwiftUI

struct MovieDetailsView: View {
    var body: some View {
        VStack(spacing: 20) {
            MovieDetailsHeaderView()
            DatePickerView()
        }
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView()
    }
}
