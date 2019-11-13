//
//  GitRepoListTableViewController.swift
//  GitRepoList
//
//  Created by Venkat Madira on 12/11/2019.
//  Copyright © 2019 Venkat Madira. All rights reserved.
//

import Foundation
import UIKit


class GitRepoListTableViewController: UITableViewController {
    var repoLists: [Repository] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
         tableView.tableFooterView = UIView()
        
    }
    
    private func setup(){
        
        let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        UIApplication.shared.beginIgnoringInteractionEvents()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string:"https://api.github.com/orgs/square/repos")!
        
        WebService().getRepoList(url: url) { (results) in
            print(results)
            print(results.count)
            if (results.count>0){
                //update table view
                self.repoLists.append(contentsOf: results)
                 DispatchQueue.main.async {
                    activityIndicator.stopAnimating()
                    UIApplication.shared.endIgnoringInteractionEvents()
                    self.tableView.reloadData()
                }
            }
        
        }
    }
    
    //table view methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repoLists.count
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TableViewCell else{
            return UITableViewCell()
        }
        cell.repoName.text = repoLists[indexPath.row].name.capitalized
        cell.repoDescription.text = repoLists[indexPath.row].description
      return cell
    }
}
