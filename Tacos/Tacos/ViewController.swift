//
//  ViewController.swift
//  Tacos
//
//  Created by Sam Meech-Ward on 2018-05-15.
//  Copyright © 2018 meech-ward. All rights reserved.
//

import UIKit
import SQLite3

class ViewController: UIViewController {
  
  var database: OpaquePointer?
  
  func openDatabase() {
    var filePath = ""
    do {
      filePath = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("database.db").path
    } catch let error {
      print("Oh Noooo error \(error)")
    }
    
    
    let status = sqlite3_open(filePath, &database)
    if status != SQLITE_OK {
      print("Oh Noooo error opening")
      return
    }
  }

  func closeDatabase() {
    let status = sqlite3_close(database)
    if status != SQLITE_OK {
      print("Oh Noooo error closing")
      return
    }
  }
  
  func createTacoTable() {
    let query = """
    CREATE TABLE tacos (
      id INTEGER PRIMARY KEY,
      protein VARCHAR(255),
      name VARCHAR(255),
      cost INTEGER,
      timeEaten INTEGER
    );
    """
    let status = sqlite3_exec(database, query, nil, nil, nil)
    if status != SQLITE_OK {
      print("ERRor")
      return
    }
  }
  
  func createTAcos() {
    let rightNow = Date()
    let timeStamp = Int(rightNow.timeIntervalSince1970)
    
    let query = """
    INSERT INTO tacos (name, protein, cost, timeEaten)
    VALUES ('taco time', 'beef', 100, \(timeStamp))
    """
    let status = sqlite3_exec(database, query, nil, nil, nil)
    if status != SQLITE_OK {
      print("💩")
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    openDatabase()
    
    // Any queries happen here
//    if userDefaults.openedZeroTimes {
//      createTacoTable()
//      createTAcos()
//    }
    
    let query = "SELECT * FROM tacos;"
    
    var queryStatement: OpaquePointer?
    let status = sqlite3_prepare_v2(database, query, -1, &queryStatement, nil)
    if status != SQLITE_OK {
      print("💩")
    }
    
    var stepStatus = sqlite3_step(queryStatement)
    
    while stepStatus == SQLITE_ROW {
      // Get the data from the row
      let protein = String(cString: sqlite3_column_text(queryStatement, 1))
      let name = String(cString: sqlite3_column_text(queryStatement, 2))
      
      print("name: \(name), protein \(protein)")
      
      stepStatus = sqlite3_step(queryStatement)
    }
    
    sqlite3_finalize(queryStatement)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    closeDatabase()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}

