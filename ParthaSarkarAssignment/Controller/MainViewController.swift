//
//  ViewController.swift
//  ParthaSarkarAssignment
//
//  Created by Partha Sarkar on 24/07/18.
//  Copyright © 2018 Partha Sarkar. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableMainView: UITableView!
    
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var loaderView: UIStackView!
    
    var viewModel: MainViewModel!
    var indicator = UIActivityIndicatorView()
    let cellId = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = MainViewModel()
        self.tableMainView.delegate = self
        self.tableMainView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.loadMostPopularAPI()
        
    }
    
    private func loadMostPopularAPI(){
        self.viewModel.getMostPopularAPI({ response in
            self.viewModel.apiData = response
            self.tableMainView.separatorStyle = .singleLine
            DispatchQueue.main.async {
                self.loaderView.isHidden = true
                self.tableMainView.reloadData()
            }
        }, errorHandling: { err in
            print(err)
        })
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickOnBurgerMenu(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "NY MostPopular", message: "You've pressed menu.", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
            print("You've pressed menu");
        }
        
        let action2 = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction) in
            print("You've pressed cancel");
        }

        alertController.addAction(action)
        alertController.addAction(action2)
        self.present(alertController, animated: true, completion: nil)
        
    }
    @IBAction func clickOnSearch(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "NY MostPopular", message: "You've pressed search.", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Cancel", style: .default) { (action:UIAlertAction) in
            print("You've pressed Search");
        }
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
        
    }
    @IBAction func clickOnMore(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "NY MostPopular", message: "You've pressed More.", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Cancel", style: .default) { (action:UIAlertAction) in
            print("You've pressed More");
        }
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
        
    }
}

extension MainViewController :UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.apiData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MainTableViewCell
        cell.setData = self.viewModel.apiData[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
}










