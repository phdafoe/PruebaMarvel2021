//
//  ComicsViewModel.swift
//  PruebaMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek
//

import Foundation

class ComicsViewModel: NSObject {
    let title: String?
    let thumbnail: Thumbnail?
    
    init(viewModel: ResultComics) {
        self.title = viewModel.title
        self.thumbnail = viewModel.thumbnail
    }
}
