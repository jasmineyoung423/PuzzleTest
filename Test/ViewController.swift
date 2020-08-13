//
//  ViewController.swift
//  Test
//
//  Created by Jasmine Young on 8/3/20.
//  Copyright © 2020 Jasmine Young. All rights reserved.
//


// MARK: - Puzzle Piece Template

//        // BASE
//        let curve = UIBezierPath()
//        // point NW
//        curve.move(to: CGPoint(x: 0, y: 0))
//        // to NE
//        curve.addLine(to: CGPoint(x: iv.bounds.size.width/2, y: 0))
//        // to SE
//        curve.addLine(to: CGPoint(x: iv.bounds.size.width/2, y: iv.bounds.size.height/3))
//        // to SW
//        curve.addLine(to: CGPoint(x: 0, y:  iv.bounds.size.height/3))
//        // to NW
//        curve.addLine(to: CGPoint(x: 0, y: 0))
//         // close shape
//        curve.close()
//
//        // CONNECTORS
//        // N male connector
//        curve.addArc(withCenter: CGPoint(x: iv.bounds.size.width/4, y: 0), radius: radius!, startAngle: .pi, endAngle: 0, clockwise: true)
//        // N female connector
//        curve.addArc(withCenter: CGPoint(x: iv.bounds.size.width/4, y: 0), radius: radius!, startAngle: .pi, endAngle: 0, clockwise: false)
//
//        // E male connector
//        curve.addArc(withCenter: CGPoint(x: iv.bounds.size.width/2, y: iv.bounds.size.height/6), radius: radius!, startAngle: (3 * .pi)/2, endAngle: .pi/2, clockwise: true)
//        // E female connector
//        curve.addArc(withCenter: CGPoint(x: iv.bounds.size.width/2, y: iv.bounds.size.height/6), radius: radius!, startAngle: (3 * .pi)/2, endAngle: .pi/2, clockwise: false)
//
//        // S male connector
//        curve.addArc(withCenter: CGPoint(x: iv.bounds.size.width/4, y: iv.bounds.size.height/3), radius: radius!, startAngle: 0, endAngle: .pi, clockwise: true)
//        // S female connector
//        curve.addArc(withCenter: CGPoint(x: iv.bounds.size.width/4, y: iv.bounds.size.height/3), radius: radius!, startAngle: 0, endAngle: .pi, clockwise: false)
//
//        // W male connector
//        curve.addArc(withCenter: CGPoint(x: 0, y: iv.bounds.size.height/6), radius: radius!, startAngle: .pi/2, endAngle: (3 * .pi)/2, clockwise: true)
//        // W female connector
//        curve.addArc(withCenter: CGPoint(x: 0, y: iv.bounds.size.height/6), radius: radius!, startAngle: .pi/2, endAngle: (3 * .pi)/2, clockwise: false)













import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var iv: UIImageView!
    let cutOutPercent: CGFloat = 100/720
    var radius: CGFloat?
    let maskPath = UIBezierPath()
    let shapemask = CAShapeLayer()
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(iv.bounds.size) // should be 414.0 x 552.0
        radius = iv.bounds.size.width * cutOutPercent
        shapemask.frame = iv.bounds
        shapemask.masksToBounds = true
        
        createPieceMask(puzzle: 1, piece: 1)
        createPieceMask(puzzle: 1, piece: 2)
        createPieceMask(puzzle: 1, piece: 3)
        createPieceMask(puzzle: 1, piece: 4)
        createPieceMask(puzzle: 1, piece: 5)
        createPieceMask(puzzle: 1, piece: 6)
    }
    
    
    // MARK: - CreatePiece Switch
    func createPieceMask(puzzle:Int, piece:Int) {
        print("Trying create piece \(piece) of puzzle \(puzzle)")
        var curve = UIBezierPath()
    
        switch puzzle {
            case 1:
                switch piece {
                case 1:
                    curve = createPuzzle1Piece1()
                case 2:
                    curve = createPuzzle1Piece2()
                case 3:
                    curve = createPuzzle1Piece3()
                case 4:
                    curve = createPuzzle1Piece4()
                case 5:
                    curve = createPuzzle1Piece5()
                case 6:
                    curve = createPuzzle1Piece6()
                default:
                    print("Invalid Piece Index")
                    return
                }
            default:
                print("Invalid Puzzle Index")
                return
        }
        
        maskPath.append(curve)
        shapemask.path = maskPath.cgPath
        iv.layer.mask = shapemask
        
    }
    
    // MARK: - Puzzle1 Piece1
    func createPuzzle1Piece1() -> UIBezierPath {
        print("Creating Puzzle 1 Piece 1")
        // -- COL 1 ROW 1
        
        let curve = UIBezierPath()
        // point NW
        curve.move(to: CGPoint(x: 0, y: 0))
        // to NE
        curve.addLine(to: CGPoint(x: iv.bounds.size.width/2, y: 0))
        // E female connector
        curve.addArc(withCenter: CGPoint(x: iv.bounds.size.width/2, y: iv.bounds.size.height/6), radius: radius!, startAngle: (3 * .pi)/2, endAngle: .pi/2, clockwise: false)
        // to SE
        curve.addLine(to: CGPoint(x: iv.bounds.size.width/2, y: iv.bounds.size.height/3))
        // S male connector
        curve.addArc(withCenter: CGPoint(x: iv.bounds.size.width/4, y: iv.bounds.size.height/3), radius: radius!, startAngle: 0, endAngle: .pi, clockwise: true)
        // to SW
        curve.addLine(to: CGPoint(x: 0, y:  iv.bounds.size.height/3))
        // to NW
        curve.addLine(to: CGPoint(x: 0, y: 0))
         // close shape
        curve.close()
        return curve
    }
    
    // MARK: - Piece2
    func createPuzzle1Piece2() -> UIBezierPath {
        print("Creating Puzzle 1 Piece 2")
        // -- COL 2 ROW 1
        
        let curve = UIBezierPath()
        // point NW
        curve.move(to: CGPoint(x: iv.bounds.size.width/2, y: 0))
        // to NE
        curve.addLine(to: CGPoint(x: iv.bounds.size.width, y: 0))
        // to SE
        curve.addLine(to: CGPoint(x: iv.bounds.size.width, y: iv.bounds.size.height/3))
        // S female connector
        curve.addArc(withCenter: CGPoint(x: iv.bounds.size.width - iv.bounds.size.width/4, y: iv.bounds.size.height/3), radius: radius!, startAngle: 0, endAngle: .pi, clockwise: false)
        // to SW
        curve.addLine(to: CGPoint(x: iv.bounds.size.width/2, y:  iv.bounds.size.height/3))
        // W male connector
        curve.addArc(withCenter: CGPoint(x: iv.bounds.size.width/2, y: iv.bounds.size.height/6), radius: radius!, startAngle: .pi/2, endAngle: (3 * .pi)/2, clockwise: true)
        // to NW
        curve.addLine(to: CGPoint(x: iv.bounds.size.width/2, y: 0))
         // close shape
        curve.close()
        return curve
    }
    
    // MARK: - Piece3
    func createPuzzle1Piece3() -> UIBezierPath {
        print("Creating Puzzle 1 Piece 3")
        // -- COL 1 ROW 2
        
        let curve = UIBezierPath()
        // point NW
        curve.move(to: CGPoint(x: 0, y: iv.bounds.size.height/3))
        // N female connector
        curve.addArc(withCenter: CGPoint(x: iv.bounds.size.width/4, y: iv.bounds.size.height/3), radius: radius!, startAngle: .pi, endAngle: 0, clockwise: false)
        // to NE
        curve.addLine(to: CGPoint(x: iv.bounds.size.width/2, y: iv.bounds.size.height/3))
        // to SE
        curve.addLine(to: CGPoint(x: iv.bounds.size.width/2, y: iv.bounds.size.height/1.5))
        // to SW
        curve.addLine(to: CGPoint(x: 0, y:  iv.bounds.size.height/1.5))
        // to NW
        curve.addLine(to: CGPoint(x: 0, y: iv.bounds.size.height/3))
         // close shape
        curve.close()
        return curve
    }
    
    // MARK: - Piece4
    func createPuzzle1Piece4() -> UIBezierPath {
        print("Creating Puzzle 1 Piece 4")
        // -- COL 2 ROW 2
        
        let curve = UIBezierPath()
        // point NW
        curve.move(to: CGPoint(x: iv.bounds.size.width/2, y: iv.bounds.size.height/3))
        // N male connector
        curve.addArc(withCenter: CGPoint(x: iv.bounds.size.width - iv.bounds.size.width/4, y: iv.bounds.size.height/3), radius: radius!, startAngle: .pi, endAngle: 0, clockwise: true)
        // to NE
        curve.addLine(to: CGPoint(x: iv.bounds.size.width, y: iv.bounds.size.height/3))
        // to SE
        curve.addLine(to: CGPoint(x: iv.bounds.size.width, y: iv.bounds.size.height/1.5))
        // to SW
        curve.addLine(to: CGPoint(x: iv.bounds.size.width/2, y:  iv.bounds.size.height/1.5))
        // to NW
        curve.addLine(to: CGPoint(x: iv.bounds.size.width/2, y: iv.bounds.size.height/3))
         // close shape
        curve.close()
        return curve
    }
    
    // MARK: - Piece5
    func createPuzzle1Piece5() -> UIBezierPath {
        print("Creating Puzzle 1 Piece 5")
        // -- COL 1 ROW 3
        
        let curve = UIBezierPath()
        // point NW
        curve.move(to: CGPoint(x: 0, y: iv.bounds.size.height - iv.bounds.size.height/3))
        // to NE
        curve.addLine(to: CGPoint(x: iv.bounds.size.width/2, y: iv.bounds.size.height - iv.bounds.size.height/3))
        // E male connector
        curve.addArc(withCenter: CGPoint(x: iv.bounds.size.width/2, y: iv.bounds.size.height - iv.bounds.size.height/6), radius: radius!, startAngle: (3 * .pi)/2, endAngle: .pi/2, clockwise: true)
        // to SE
        curve.addLine(to: CGPoint(x: iv.bounds.size.width/2, y: iv.bounds.size.height))
        // to SW
        curve.addLine(to: CGPoint(x: 0, y:  iv.bounds.size.height))
        // to NW
        curve.addLine(to: CGPoint(x: 0, y: iv.bounds.size.height - iv.bounds.size.height/3))
         // close shape
        curve.close()
        return curve
    }
    
    // MARK: - Piece6
    func createPuzzle1Piece6() -> UIBezierPath {
        print("Creating Puzzle 1 Piece 6")
        // -- COL 2 ROW 3

        let curve = UIBezierPath()
        // point NW
        curve.move(to: CGPoint(x: iv.bounds.size.width/2, y: iv.bounds.size.height - iv.bounds.size.height/3))
        // to NE
        curve.addLine(to: CGPoint(x: iv.bounds.size.width, y: iv.bounds.size.height - iv.bounds.size.height/3))
        // to SE
        curve.addLine(to: CGPoint(x: iv.bounds.size.width, y: iv.bounds.size.height))
        // to SW
        curve.addLine(to: CGPoint(x: iv.bounds.size.width/2, y:  iv.bounds.size.height))
        // W female connector
        curve.addArc(withCenter: CGPoint(x: iv.bounds.size.width/2, y: iv.bounds.size.height - iv.bounds.size.height/6), radius: radius!, startAngle: .pi/2, endAngle: (3 * .pi)/2, clockwise: false)
        // to NW
        curve.addLine(to: CGPoint(x: iv.bounds.size.width/2, y: iv.bounds.size.height - iv.bounds.size.height/3))
         // close shape
        curve.close()
        return curve
    }
}
