//
//  ViewController.swift
//  SimpsonBooks
//
//  Created by Batuhan Demirbaş on 11.01.2022.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    var mySimpsons = [Simpson]()
    var chosenSimpson : Simpson?
    var simpsonImages = [UIImage]()
    var simpsonNames = [String]()
    var simpsonJobs = [String]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        //Simpson Objects
        
        let hommer = Simpson(simpsonName: "Hommer Simpson", simpsonJob: "Nuclear Safety", simpsonImage:UIImage(named: "HomerSimpson")!)
        let marge = Simpson(simpsonName: "Marge Simpson", simpsonJob: "HouseWife", simpsonImage:UIImage(named: "MargeSimpson")!)
        let bart = Simpson(simpsonName: "Bart Simpson", simpsonJob: "Student", simpsonImage:UIImage(named: "BartSimpson")!)
        let lisa = Simpson(simpsonName: "Lisa Simpson", simpsonJob: "Student", simpsonImage:UIImage(named: "LisaSimpson")!)
        let maggie = Simpson(simpsonName: "Maggie Simpson", simpsonJob: "Baby", simpsonImage:UIImage(named: "MaggieSimpson")!)
        
        mySimpsons.append(hommer)
        mySimpsons.append(marge)
        mySimpsons.append(bart)
        mySimpsons.append(lisa)
        mySimpsons.append(maggie)
        
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  UITableViewCell()
        cell.textLabel?.text = mySimpsons[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpsons.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = mySimpsons [indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: "nil")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedSimpson = chosenSimpson
        }
    }

}

