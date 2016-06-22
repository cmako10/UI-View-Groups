//
//  GroupView.swift
//  CustomUIViewBlocks
//
//  Created by cole on 6/21/16.
//  Copyright © 2016 Blue Wolf. All rights reserved.
//

import UIKit

    class GroupView: UIView {

      var rows: Int!
      var columns: Int!
      var size: CGSize!
      var origin: CGPoint!
      
      enum TypeToAdd: String {
        case row = "Row"
        case column = "Column"
      }

      enum AlterAction: String {
        case add = "Add"
        case delete = "Delete"
      }
      
      convenience init(origin: CGPoint, size: CGSize, columns: Int, rows: Int) {
        self.init(frame: CGRect(origin: origin, size: size))
        self.size = size
        self.origin = origin
        self.rows = rows
        self.columns = columns
      }

      override func drawRect(rect: CGRect) {
        frame.size.width = size.width
        frame.size.height = size.height
        super.drawRect(rect)
        for view in self.subviews {
          view.removeFromSuperview()
        }
        let width = size.width / CGFloat(columns)
        let height = size.height / CGFloat(rows)
        let subviewSize = CGSize(width: width, height: height)
        for y in 0..<rows {
          for x in 0..<columns {
            let newView = UIView(frame: CGRect(origin: CGPoint(x: (CGFloat(x) * width), y: (CGFloat(y) * height)), size: subviewSize))
            
            let label = UILabel(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: subviewSize))
            label.adjustsFontSizeToFitWidth = true
            label.textAlignment = .Center
            label.font = UIFont.systemFontOfSize(15, weight: 10.0)
            label.textColor = UIColor.blackColor()
            label.center = CGPoint(x: newView.frame.midX, y: newView.frame.midY)
            label.text = "[\(x), \(y)]"
            newView.addSubview(label)
            
            if y % 2 == 0 {
              if x % 2 == 0 {
                newView.backgroundColor = UIColor.lightGrayColor()
              } else {
                newView.backgroundColor = UIColor.blueColor()
              }
            } else {
              if x % 2 == 0 {
                newView.backgroundColor = UIColor.blueColor()
              } else {
                newView.backgroundColor = UIColor.lightGrayColor()
              }
            }
            addSubview(newView)
          }
        }
      }
      
      func alter(type: TypeToAdd, action: AlterAction){
        switch type {
        case .column:
          switch action {
          case .add:
            columns = columns + 1
          case .delete:
            columns = columns - 1
          }
        case .row:
          switch action {
          case .add:
            rows = rows + 1
          case .delete:
            rows = rows - 1
          }
        }
        setNeedsDisplay()
      }
    }
