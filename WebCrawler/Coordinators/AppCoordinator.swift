//
//  AppCoordinator.swift
//  WebCrawler
//
//  Created by GregoryM on 9/21/16.
//  Copyright © 2016 None. All rights reserved.
//

import UIKit


class AppCoordinator: Coordinator {
    
    var window: UIWindow
    var navigationController: UINavigationController?
    var searchCoordinator: SearchCoordinator?
    
    init (window: UIWindow) {
        self.window = window
    }
    
    func start() {
        self.navigationController = UINavigationController()
        
        self.window.rootViewController = self.navigationController
        
        self.setupRootCoordinator()
    }
}

extension AppCoordinator {
    
    fileprivate func setupRootCoordinator () {
        self.searchCoordinator = SearchCoordinator(navigationController: self.navigationController!)
        self.searchCoordinator?.start()
    }

}
