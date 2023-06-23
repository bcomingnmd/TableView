//
//  TableViewController.swift
//  TableView
//
//  Created by Zhazira Yesmakhanova on 22.06.2023.
//

import UIKit

class TableViewController: UITableViewController {

    var arrayData = [dataSource(name: "Challengers", year: "September, 2023", imageName: "challengers"),
                     dataSource(name: "Dune: Part One", year: "October, 2021", imageName: "dune1"),
                     dataSource(name: "Dune: Part Two", year: "November, 2023", imageName: "dune2"),
                     dataSource(name: "Flash", year: "June, 2023", imageName: "flash"),
                     dataSource(name: "Oppenheimer", year: "July, 2023", imageName: "oppenheimer")]
    
    var arrayInfo = [detailSource(filmGenre: "Drama, Romance, Sport", filmDirector: "Luca Guadagnino", filmDescription: "Follows   three players who knew each other when they were teenagers as they compete in a tennis tournament to be the world-famous grand slam winner, and reignite old rivalries on and off the court."),
                     detailSource(filmGenre: "Action, Adventure, Drama", filmDirector: "Denis Villeneuve", filmDescription: "A noble family becomes embroiled in a war for control over the galaxy's most valuable asset while its heir becomes troubled by visions of a dark future."),
                     detailSource(filmGenre: "Action, Adventure, Drama", filmDirector: "Denis Villeneuve", filmDescription: "A boy becomes the Messiah of nomads on a desert planet that has giant worms that protect a commodity called Spice. Spice changes people into travelers, mystics and madmen. What price will he pay to become the new ruler of their universe?"),
                     detailSource(filmGenre: "Action, Adventure, Fantasy", filmDirector: "Andy Muschietti", filmDescription: "Barry Allen uses his super speed to change the past, but his attempt to save his family creates a world without super heroes, forcing him to race for his life in order to save the future."),
                     detailSource(filmGenre: "Biography, History, Drama", filmDirector: "Christopher Nolan", filmDescription: "The story of American scientist J. Robert Oppenheimer and his role in the development of the atomic bomb.")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    @IBAction func addMovie(_ sender: Any) {
        arrayData.append(dataSource(name: "enter data", year: "enter data", imageName: "defaultImage"))
        arrayInfo.append(detailSource(filmGenre: "enter data", filmDirector: "enter data", filmDescription: "enter data"))
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayData.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Movies", for: indexPath)
    
        let label = cell.viewWithTag(1) as! UILabel
        label.text = arrayData[indexPath.row].name
        
        let labelYear = cell.viewWithTag(2) as! UILabel
        labelYear.text = arrayData[indexPath.row].year
        
        let image = cell.viewWithTag(3) as! UIImageView
        image.image = UIImage(named: arrayData[indexPath.row].imageName)
        
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
//    func "didSelect" shows data on the second screen (ViewController):
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = storyboard?.instantiateViewController(identifier: "detailViewController") as! ViewController
        detail.data = arrayData[indexPath.row]
        detail.detail = arrayInfo[indexPath.row]
        navigationController?.show(detail, sender: self)
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            arrayData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
