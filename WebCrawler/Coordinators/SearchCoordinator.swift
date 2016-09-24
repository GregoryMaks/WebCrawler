//
//  SearchCoordinator.swift
//  WebCrawler
//
//  Created by GregoryM on 9/21/16.
//  Copyright © 2016 None. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard


class SearchCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    var storyboard: SwinjectStoryboard?

    var searchVC: SearchViewController?
    
    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        self.showRootSearchController()
    }
}

fileprivate extension SearchCoordinator {
    
    func showRootSearchController () {
        let storyboardDIContainer = Container()
        storyboardDIContainer.registerForStoryboard(SearchViewController.self) { resolver, viewController in
            viewController.viewModel = resolver.resolve(SearchViewModelType.self) as? SearchViewModel
        }
        storyboardDIContainer.register(SearchViewModelType.self) { r in
            return SearchViewModel()
        }
        
        self.storyboard = SwinjectStoryboard.create(name:"Main", bundle:Bundle.main, container: storyboardDIContainer);
        self.searchVC = self.storyboard?.instantiateViewController(withIdentifier: String(describing: SearchViewController.self)) as! SearchViewController?
        
        self.navigationController.setViewControllers([self.searchVC!], animated: false)
    }
}
