//
//  SearchViewController.swift
//  WebCrawler
//
//  Created by GregoryM on 9/21/16.
//  Copyright © 2016 None. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class SearchViewController: UIViewController {

    @IBOutlet weak var searchURLTextField: UITextField!
    @IBOutlet weak var searchTextTextField: UITextField!
    
    @IBOutlet weak var resultsCountTextField: UITextField!
    @IBOutlet weak var resultsCountSlider: UISlider!
    @IBOutlet weak var searchDepthTextField: UITextField!
    @IBOutlet weak var searchDepthSlider: UISlider!
    @IBOutlet weak var threadCountTextField: UITextField!
    @IBOutlet weak var threadCountSlider: UISlider!
    
    @IBOutlet weak var scrollViewBottobGuideConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var scrollView: UIScrollView?
    
    var viewModel: SearchViewModel?
    fileprivate var disposeBag: DisposeBag?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.installKeyboardVisualHandler()
        
        self.setupBindings()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func beginSearchDidClick(_ sender: AnyObject) {
        self.viewModel!.beginSearch()
    }
}

extension SearchViewController {
    
    fileprivate func setupBindings () {
        self.disposeBag = DisposeBag()
        
        self.resultsCountSlider.rx.value
            .map({ (val) -> String in
                return String(format: "%.0f", val)
            })
            .bindTo(self.resultsCountTextField.rx.text)
            .addDisposableTo(self.disposeBag!)
        
        self.searchDepthSlider.rx.value
            .map({ (val) -> String in
                return String(format: "%.0f", val)
            })
            .bindTo(self.searchDepthTextField.rx.text)
            .addDisposableTo(self.disposeBag!)
        
        self.threadCountSlider.rx.value
            .map({ (val) -> String in
                return String(format: "%.0f", val)
            })
            .bindTo(self.threadCountTextField.rx.text)
            .addDisposableTo(self.disposeBag!)
        
        self.searchURLTextField.rx.controlEvent(UIControlEvents.editingDidEndOnExit)
            .subscribe(onNext: {
                self.searchTextTextField.becomeFirstResponder()
            })
            .addDisposableTo(self.disposeBag!)
        
        self.searchTextTextField.rx.controlEvent(UIControlEvents.editingDidEndOnExit)
            .subscribe(onNext: {
                self.viewModel!.beginSearch()
            })
            .addDisposableTo(self.disposeBag!)
    }
    
    fileprivate func installKeyboardVisualHandler () {
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardDidShow,
                                               object: nil,
                                               queue: nil)
        { (notification) in
            let keyboardSize: CGSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue.size;
            
            self.scrollViewBottobGuideConstraint.constant = keyboardSize.height
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardDidHide,
                                               object: nil,
                                               queue: nil)
        { (notification) in
            self.scrollViewBottobGuideConstraint.constant = 0
        }
    }
    
}
