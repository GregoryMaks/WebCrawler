//
//  SearchViewModel.swift
//  WebCrawler
//
//  Created by GregoryM on 9/22/16.
//  Copyright © 2016 None. All rights reserved.
//

import Foundation


protocol SearchViewModelType {
    var inputModel: SearchInputModel { get }
    
    func beginSearch ()
}


class SearchViewModel: SearchViewModelType {
    var inputModel: SearchInputModel
    
    init () {
        self.inputModel = SearchInputModel()
    }
    
    func beginSearch () {
    }
}
