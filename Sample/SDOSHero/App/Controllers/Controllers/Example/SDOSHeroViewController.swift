//
//  SDOSHeroViewController.swift
//  SDOSHeroExample
//
//  Created by Antonio Jesús Pallares on 02/05/2019.
//  Copyright © 2019 SDOS. All rights reserved.
//

import Foundation
import SDOSHero
import Hero

class SDOSHeroViewController: BaseViewController {
    
    private static let cellNibName = "ExampleTableViewCell"
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let arrayAnimationTypes: [String] = {
        HeroDefaultAnimationType.allPosibleAnimationTypes.map{ $0.identifier }
    }()
    private lazy var heroIdPrefix: String = {
        return UUID().uuidString
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadStyle()
        registerCells()
    }
    
    private func loadStyle() {
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationItem.largeTitleDisplayMode = .automatic
        }
        navigationController?.hero.isEnabled = true
        hero.isEnabled = true
        navigationItem.title = (navigationController is SDOSHeroNavigationController) ? "Navigation" : "Modal";
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: type(of: self).cellNibName, bundle: nil), forCellReuseIdentifier: type(of: self).cellNibName)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == ShowDetailStoryboardSegue else { return }
        guard
            let detailVC = segue.destination as? SDOSHeroDetailViewController,
            let indexPath = sender as? NSIndexPath
            else { return }
        detailVC.textAnimationType = arrayAnimationTypes[indexPath.row]
        detailVC.heroIdPrefix = heroIdPrefix
    }
    
}

extension SDOSHeroViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayAnimationTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: type(of: self).cellNibName) as? ExampleTableViewCell else {
            return UITableViewCell()
        }
        
        cell.lbTitle.text = arrayAnimationTypes[indexPath.row]
        cell.lbTitle.hero.id = heroIdPrefix + arrayAnimationTypes[indexPath.row]
        cell.lbTitle.hero.modifiers = [.arc(intensity: 1)]
        
        return cell
    }
    
}

extension SDOSHeroViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let animationType = HeroDefaultAnimationType.typeForIdentifier(arrayAnimationTypes[indexPath.row])
        if let navigationController = navigationController as? SDOSHeroNavigationController {
            navigationController.animationTypeForPush = animationType
            performSegue(withIdentifier: ShowDetailStoryboardSegue, sender: indexPath)
        } else if let detailNavigationController = storyboard?.instantiateViewController(withIdentifier: SDOSHeroDetailNavigationViewControllerIdentifier) as? SDOSHeroNavigationController {
            detailNavigationController.hero.isEnabled = true
            detailNavigationController.animationTypeForPresenting = animationType
            if let detailVC = detailNavigationController.viewControllers.first as? SDOSHeroDetailViewController {
                detailVC.textAnimationType = arrayAnimationTypes[indexPath.row]
                detailVC.heroIdPrefix = heroIdPrefix
            }
            tabBarController?.present(detailNavigationController, animated: true, completion: nil)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
