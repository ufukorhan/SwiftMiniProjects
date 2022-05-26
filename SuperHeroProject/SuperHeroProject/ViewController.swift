//
//  ViewController.swift
//  SuperHeroProject
//
//  Created by Ufuk Orhan on 17.05.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var superHeroNames = [String]()
    var superHeroPictures = [String]()
    
    var chosenName = ""
    var chosenPicture = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        superHeroNames.append("Batman")
        superHeroNames.append("Captain America")
        superHeroNames.append("Deadpool")
        superHeroNames.append("Spiderman")
        superHeroNames.append("Superman")
        
   
        superHeroPictures.append("batman")
        superHeroPictures.append("captain")
        superHeroPictures.append("deed")
        superHeroPictures.append("spider")
        superHeroPictures.append("superman")

        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superHeroNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = superHeroNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            superHeroPictures.remove(at: indexPath.row)
            superHeroNames.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenName = superHeroNames[indexPath.row]
        chosenPicture = superHeroPictures[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.chosenHeroName = chosenName
            destinationVC.chosenHeroPictureName = chosenPicture
        }
    }
}

