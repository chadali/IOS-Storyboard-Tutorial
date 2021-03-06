//
//  PlayersViewController.swift
//  StoryboardTutorial
//
//  Created by ali chaudhry on 7/6/18.
//  Copyright © 2018 ali chaudhry. All rights reserved.
//

import UIKit

class PlayersViewController: UITableViewController {
    var players = SampleData.genereatePlayerData()
    var selectedRow: Int?
}


extension PlayersViewController {
    override func viewDidLoad() {
        super .viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    @IBAction func cancelToPlayersViewController(_ segue: UIStoryboardSegue) {
    }
    
    @IBAction func savePlayerDetail(_ segue: UIStoryboardSegue) {
        guard let playerDetailsViewController = segue.source as? PlayerDetailsViewController,
            let player = playerDetailsViewController.player else {
                return
        }
        
        // add the new player to the players array
        players.append(player)
        
        // update the tableView
        let indexPath = IndexPath(row: players.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super .setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: animated)
    }
    
}

extension PlayersViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerCell
        let player = players[indexPath.row]
        cell.player = player
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            players.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: false)
        selectedRow = indexPath.row
        self.performSegue(withIdentifier: "toGameDetails", sender: indexPath)
        /*let myPopup = UIStoryboard(name: "Players", bundle: nil).instantiateViewController(withIdentifier: "gameDetailsPopup") as! GameDetailsViewController
        self.present(myPopup,animated: true)*/
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGameDetails" {
            let popup = segue.destination as! GameDetailsViewController
            // Can't define variable with didSet in this view I guess
            popup.incomingGame = players[selectedRow!].game!
            popup.incomingName = players[selectedRow!].name!
            popup.incomingImage = "\(players[selectedRow!].rating)Stars"
        }
    }
}


