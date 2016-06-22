//
//  ViewController.swift
//  CustomUIViewBlocks
//
//  Created by cole on 6/20/16.
//  Copyright © 2016 Blue Wolf. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

  var grid: GroupView!
  
  @IBOutlet weak var widthTF: UITextField!
  
  @IBOutlet weak var heightTF: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    widthTF.text = "375"
    heightTF.text = "100"
    let width = CGFloat(Float(widthTF.text!)!)
    let height = CGFloat(Float(heightTF.text!)!)
    grid = GroupView(origin: CGPoint(x: 0, y: 100), size: CGSize(width: width, height: height), columns: 4, rows: 1)
    
    widthTF.addTarget(self, action: #selector(ViewController.textDidChangeW(_:)), forControlEvents: .EditingChanged)
    heightTF.addTarget(self, action: #selector(ViewController.textDidChangeH(_:)), forControlEvents: .EditingChanged)
    
    view.addSubview(grid)
    
  }
  
  func textDidChangeW(sender: UITextField) {
    if let widthTextVal = widthTF.text, let width = Float(widthTextVal) {
      grid.size.width = CGFloat(width)
      grid.setNeedsDisplay()
    }

  }
  
  func textDidChangeH(sender: UITextField) {
    if let heightTextVal = heightTF.text, let height = Float(heightTextVal) {
      grid.size.height = CGFloat(height)
      grid.setNeedsDisplay()
    }
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
  @IBAction func addRow(sender: UIButton) {
    grid.alter(GroupView.TypeToAdd.row, action: GroupView.AlterAction.add)
  }

  @IBAction func deleteRow(sender: UIButton) {
    grid.alter(GroupView.TypeToAdd.row, action: GroupView.AlterAction.delete)
  }
  
  @IBAction func addColumn(sender: UIButton) {
    grid.alter(GroupView.TypeToAdd.column, action: GroupView.AlterAction.add)
  }
  
  @IBAction func deleteColumn(sender: UIButton) {
    grid.alter(GroupView.TypeToAdd.column, action: GroupView.AlterAction.delete)
  }

}

