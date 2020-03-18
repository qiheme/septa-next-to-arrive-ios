//
//  ViewController.swift
//  SEPTANextToArrive
//
//  Created by Iheme, Quincy on 3/18/20.
//  Copyright © 2020 Iheme, Quincy. All rights reserved.
//

import UIKit

class ViewController:UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stations.count
    }
     
     // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return stations[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        print(row)
        print(component)
    }

    @IBOutlet weak var startingStationPicker: UIPickerView!
    @IBOutlet weak var endingStationPicker: UIPickerView!
    
    var stations: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.startingStationPicker.delegate = self
        self.startingStationPicker.dataSource = self
        
        self.endingStationPicker.delegate = self
        self.endingStationPicker.dataSource = self

        stations = ["30th Street Station",
            "49th Street",
            "9th Street",
            "Airport Terminal A",
            "Airport Terminal B",
            "Airport Terminals C & D",
            "Airport Terminals E & F",
            "Allegheny",
            "Allen Lane",
            "Ambler",
            "Angora",
            "Ardmore",
            "Ardsley",
            "Bala",
            "Berwyn",
            "Bethayres",
            "Bridesburg",
            "Bristol",
            "Bryn Mawr",
            "Carpenter",
            "Chalfont",
            "Chelten Avenue",
            "Cheltenham",
            "Chester Transportation Center",
            "Chestnut Hill East",
            "Chestnut Hill West",
            "Churchmans Crossing",
            "Claymont",
            "Clifton–Aldan",
            "Colmar",
            "Conshohocken",
            "Cornwells Heights",
            "Crestmont",
            "Croydon",
            "Crum Lynne",
            "Curtis Park",
            "Cynwyd",
            "Darby",
            "Daylesford",
            "Delaware Valley University",
            "Devon",
            "Downingtown",
            "Doylestown",
            "East Falls",
            "Eastwick",
            "Eddington",
            "Eddystone",
            "Elkins Park",
            "Elm Street",
            "Elwyn",
            "Exton",
            "Fern Rock Transportation Center",
            "Fernwood–Yeadon",
            "Folcroft",
            "Forest Hills",
            "Fort Washington",
            "Fortuna",
            "Fox Chase",
            "Germantown",
            "Gladstone",
            "Glenolden",
            "Glenside",
            "Gravers",
            "Gwynedd Valley",
            "Hatboro",
            "Haverford",
            "Highland Avenue",
            "Highland",
            "Holmesburg Junction",
            "Ivy Ridge",
            "Jefferson Station",
            "Jenkintown–Wyncote",
            "Langhorne",
            "Lansdale",
            "Lansdowne",
            "Lawndale",
            "Levittown",
            "Link Belt",
            "Main Street",
            "Malvern",
            "Manayunk",
            "Marcus Hook",
            "Meadowbrook",
            "Media",
            "Melrose Park",
            "Merion",
            "Miquon",
            "Morton",
            "Mount Airy",
            "Moylan–Rose Valley",
            "Narberth",
            "Neshaminy Falls",
            "New Britain",
            "Newark",
            "Noble",
            "Norristown Transportation Center",
            "North Broad",
            "North Hills",
            "North Philadelphia",
            "North Wales",
            "Norwood",
            "Olney",
            "Oreland",
            "Overbrook",
            "Paoli",
            "Penllyn",
            "Penn Medicine",
            "Pennbrook",
            "Philmont",
            "Primos",
            "Prospect Park",
            "Queen Lane",
            "Radnor",
            "Ridley Park",
            "Rosemont",
            "Roslyn",
            "Rydal",
            "Ryers",
            "Secane",
            "Sedgwick",
            "Sharon Hill",
            "Somerton",
            "Spring Mill",
            "St. Davids",
            "St. Martins",
            "Stenton",
            "Strafford",
            "Suburban Station",
            "Swarthmore",
            "Tacony",
            "Temple University",
            "Thorndale",
            "Torresdale",
            "Trenton Transit Center",
            "Trevose",
            "Tulpehocken",
            "Upsal",
            "Villanova",
            "Wallingford",
            "Warminster",
            "Washington Lane",
            "Wayne Junction",
            "Wayne",
            "West Trenton",
            "Whitford",
            "Willow Grove",
            "Wilmington",
            "Wissahickon",
            "Wister",
            "Woodbourne",
            "Wyndmoor",
            "Wynnefield Avenue",
            "Wynnewood",
            "Yardley"
        ]
    }
    
    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
       }
}
