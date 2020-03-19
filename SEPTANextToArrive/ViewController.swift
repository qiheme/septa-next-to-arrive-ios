//
//  ViewController.swift
//  SEPTANextToArrive
//
//  Created by Iheme, Quincy on 3/18/20.
//  Copyright © 2020 Iheme, Quincy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var startingStation: UITextField!
    @IBOutlet weak var endingStation: UITextField!
    
    @IBOutlet weak var trainNumberLabel: UILabel!
    @IBOutlet weak var trainLineLabel: UILabel!
    @IBOutlet weak var trainDepartureLabel: UILabel!
    @IBOutlet weak var trainArrivalLabel: UILabel!
    @IBOutlet weak var trainConnectionLabel: UILabel!
    @IBOutlet weak var trainStatusLabel: UILabel!
    
    @IBOutlet weak var trainNumberPlaceholder: UILabel!
    @IBOutlet weak var trainLinePlaceholder: UILabel!
    @IBOutlet weak var trainDeparturePlaceholder: UILabel!
    @IBOutlet weak var trainArrivalPlaceholder: UILabel!
    @IBOutlet weak var trainConnectionPlaceholder: UILabel!
    @IBOutlet weak var trainStatusPlaceholder: UILabel!

    
    
    @IBAction func findNextToArrive(_ sender: UIButton) {
        let start = startingStation.text
        let end = endingStation.text
        
        let url = SEPTAApi.septaURL(start: start, end: end)
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            (data, response, error) in
            if let jsonData = data {
                if let jsonString = String(data: jsonData, encoding: .utf8) {
                    print(jsonString)
                }
            } else if let requestError = error {
                print("Error fetching next to arrive train: \(requestError)")
            } else {
                print("Unexpected error with the request")
            }
        }
        task.resume()
    }

    var selectedStation: String?
    var stationList = ["30th Street Station",
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
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stationList.count
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return stationList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        selectedStation = stationList[row] // selected item
        if pickerView.tag == 1 {
            startingStation.text = selectedStation
        } else if pickerView.tag == 2 {
            endingStation.text = selectedStation
        }
    }
    
    func createPickerView() {
        let startingPickerView = UIPickerView()
        let endingPickerView = UIPickerView()
        startingPickerView.tag = 1
        endingPickerView.tag = 2
        startingPickerView.delegate = self
        startingPickerView.dataSource = self
        endingPickerView.delegate = self
        endingPickerView.dataSource = self
        startingStation.inputView = startingPickerView
        endingStation.inputView = endingPickerView
    }
    
    func dismissPickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        startingStation.inputAccessoryView = toolBar
        endingStation.inputAccessoryView = toolBar
    }

    @objc func action() {
        view.endEditing(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createPickerView()
        dismissPickerView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
