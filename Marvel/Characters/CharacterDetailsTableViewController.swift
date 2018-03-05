//
//  CharacterDetailsTableViewController.swift
//  Marvel
//
//  Created by Usman Siddiqui on 2/26/18.
//  Copyright © 2018 Usman_Siddiqui. All rights reserved.
//

import UIKit

class CharacterDetailsTableViewController: UITableViewController {

    let utils = Utilities()
    var character = Character()
    
    struct CharactersDataConstants {
        
        static let dataCell = "dataCell"
        static let cellHeaderNib = "CellHeaderView"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        title = character.characterName
        
        tableView.delegate   = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CharactersDataConstants.dataCell)
        tableView.separatorColor = UIColor.colorWithHexValue("99FFFF")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return CharacterDataItems.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case CharacterDataItems.comics.rawValue:
            return character.comicsArr.count
        case CharacterDataItems.series.rawValue:
            return character.seriesArr.count
        case CharacterDataItems.events.rawValue:
            return character.eventsArr.count
        case CharacterDataItems.stories.rawValue:
            return character.storiesArr.count
        default:
            return 0
        }
        
    }

    func configureCell(cell: UITableViewCell,data: CharactersData) {
     
        cell.textLabel?.text = data.name
        cell.textLabel?.font = UIFont.preferredFont(forTextStyle: .caption1)
        cell.textLabel?.textColor = .black
        cell.textLabel?.numberOfLines = 0
        cell.contentView.backgroundColor = UIColor.colorWithHexValue("CCFFFF")
        
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let returnedView = UIView(frame: CGRect(x: 0, y: 10, width: tableView.frame.width, height: 40))
        returnedView.backgroundColor = UIColor.colorWithHexValue("99FFFF")
        
        let label = UILabel(frame: CGRect(x: 20, y: 5, width: 80, height: 30))
        label.text = CharacterDataItems(rawValue:section)?.title
        returnedView.addSubview(label)
        
        return returnedView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CharactersDataConstants.dataCell, for: indexPath)
        
        switch indexPath.section {
        case CharacterDataItems.comics.rawValue:
            configureCell(cell: cell, data: character.comicsArr[indexPath.row])
        case CharacterDataItems.series.rawValue:
            configureCell(cell: cell, data: character.seriesArr[indexPath.row])
        case CharacterDataItems.events.rawValue:
            configureCell(cell: cell, data: character.eventsArr[indexPath.row])
        case CharacterDataItems.stories.rawValue:
            configureCell(cell: cell, data: character.storiesArr[indexPath.row])
        default:
            return cell
        }
        
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
