//
//  SearchInputModel.swift
//  WebCrawler
//
//  Created by GregoryM on 9/24/16.
//  Copyright © 2016 None. All rights reserved.
//

import Foundation


struct SearchInputModel {
    var searchURL: NSURL?
    var searchText: String?
    var resultCount: Int
    var searchDepth: Int
    var threadCount: Int
    
    init () {
        self.resultCount = 1
        self.searchDepth = 1
        self.threadCount = 1
    }
    
    func isValid () -> Bool {
        return searchURL != nil &&
            self.searchText != nil && self.searchText!.characters.count > 0 &&
            resultCount > 0 &&
            searchDepth > 0 &&
            threadCount > 0
    }
}
