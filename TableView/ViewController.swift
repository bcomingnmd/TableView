//
//  ViewController.swift
//  TableView
//
//  Created by Zhazira Yesmakhanova on 22.06.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var nameElement: UILabel!
    
    @IBOutlet weak var labelYear: UILabel!
    @IBOutlet weak var yearElement: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var genreElement: UILabel!
    
    @IBOutlet weak var director: UILabel!
    @IBOutlet weak var directorElement: UILabel!
    
    
    @IBOutlet weak var detailedText: UITextView!
    @IBOutlet weak var descriptionElement: UILabel!
    
    var data = dataSource()
    var detail = detailSource()
    var labelNames = elements()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelName.text = data.name
        nameElement.text = labelNames.nameElement
        labelYear.text = data.year
        yearElement.text = labelNames.yearElement
        image.image = UIImage(named: data.imageName)
        genre.text = detail.filmGenre
        genreElement.text = labelNames.genreElement
        director.text = detail.filmDirector
        directorElement.text = labelNames.directorElement
        detailedText.text = detail.filmDescription
        descriptionElement.text = labelNames.textElement
    }

}

