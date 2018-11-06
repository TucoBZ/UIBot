//
//  ViewController.swift
//  UIBot
//
//  Created by TucoBZ on 09/25/2018.
//  Copyright (c) 2018 TucoBZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let tests = 0...100
    var headerText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Screen"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func push(viewController: UIViewController, with indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            guard let url = URL(string: "https://www.google.com.br") else { return }
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        default:
            if let viewController = viewController as? ViewController {
                viewController.headerText = "Last Selection \(indexPath.row)"
            }
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "viewController")
        push(viewController: vc, with: indexPath)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerText
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            return UITableViewCell()
        }
        
        cell.textLabel?.text = "\(indexPath.row)"
        
        return cell
    }
    
    
}
