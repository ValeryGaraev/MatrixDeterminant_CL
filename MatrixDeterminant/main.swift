//
//  main.swift
//  MatrixDeterminant
//
//  Created by Valery Garaev on 4/2/20.
//  Copyright © 2020 Valery Garaev. All rights reserved.
//

import Foundation

let n = 4
//
//var matrix = [[Int]]()
//
//for _ in 0..<n {
//    var tempArray = [Int]()
//    for _ in 0..<n {
//        let number = Int.random(in: 0...n)
//        tempArray.append(number)
//    }
//    matrix.append(tempArray)
//}

var matrix = [[2, 3, 1, 5], [-1, 0, 4, 2], [5, 9, -4, 3], [5, 3, 8, 3]]
//var matrix = [[2, -3, 1], [2, 0, -1], [1, 4, 5]]

func calculateDeterminant(ofMatrix matrix: [[Int]], count: Int) -> Int {
    var determinant = 0
    
    switch count {
    case 1:
        determinant = matrix[0][0]
    case 2:
        let a = matrix[0][0] * matrix[1][1]
        let b = matrix[1][0] * matrix[0][1]
        determinant = a - b
//    case 3:
//        let a = matrix[0][0] * (matrix[1][1] * matrix[2][2] - matrix[2][1] * matrix[1][2])
//        let b = matrix[0][1] * (matrix[1][0] * matrix[2][2] - matrix[2][0] * matrix[1][2])
//        let c = matrix[0][2] * (matrix[1][0] * matrix[2][1] - matrix[2][0] * matrix[1][1])
//        determinant = a - b + c
    default:
        var subMatrix = Array(repeating: Array(repeating: 0, count: count - 1), count: count - 1)
        for x in 0..<count {
            var subY = 0
            for y in 1..<count {
                var subZ = 0
                for z in 0..<count {
                    if z == x { continue }
                    subMatrix[subY][subZ] = matrix[y][z]
                    subZ += 1
                }
                subY += 1
            }
//            let power = pow(-1.0, Double(x))
            determinant = determinant + (Int(pow(-1.0, Double(x))) * matrix[0][x] * calculateDeterminant(ofMatrix: subMatrix, count: count - 1))
        }
    }
    return determinant
}


let determinant = calculateDeterminant(ofMatrix: matrix, count: n)
print(determinant)
