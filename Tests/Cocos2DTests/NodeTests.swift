//
//  NodeTests.swift
//  Cocos2D
//
//  Created by Alsey Coleman Miller on 10/15/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import XCTest
@testable import Cocos2D

final class NodeTests: XCTestCase {

    func testProperties() {
        
        let node = Node()
        
        // description
        XCTAssert(node.description.isEmpty == false)
        XCTAssert(node.description == "<Node | Tag = -1", "\(node)")
        
        // localZOrder
        var localZOrder = node.localZOrder
        localZOrder += 1
        node.localZOrder = localZOrder
        XCTAssert(node.localZOrder == localZOrder)
        
        // position
        var position = node.position
        XCTAssert(position.x == 0)
        XCTAssert(position.y == 0)
        position.x += 10
        position.y += 20
        node.position = position
        XCTAssert(node.position.x == position.x)
        XCTAssert(node.position.y == position.y)
        
        // name
        XCTAssert(node.name.isEmpty)
        let name = "My Node"
        node.name = name
        XCTAssert(node.name == name)
        
        // running
        XCTAssert(node.isRunning == false)
        
        // scene
        XCTAssert(node.scene == nil)
    }
    
    func testChildren() {
        
        do {
            
            let node = Node()
            node.name = "parent"
            
            let childNode = Node()
            childNode.name = "child"
            
            node.add(child: childNode)
            
            XCTAssert(node.children.count == 1)
            XCTAssert(node.children.first === childNode)
            XCTAssert(node.parent == nil)
            XCTAssert(childNode.parent === node)
            XCTAssert(childNode.scene == nil)
            
            // get child
            XCTAssert(node[name: "child"] === childNode)
            
            // remove from parent
            childNode.removeFromParent()
            XCTAssert(childNode.parent == nil)
            XCTAssert(node.children.isEmpty)
            
            // add again
            node.add(child: childNode)
            
            // remove child
            node.remove(child: childNode)
            XCTAssert(childNode.parent == nil)
            XCTAssert(node.children.isEmpty)
            
            // cannot add child multiple times
            node.add(child: childNode)
            node.add(child: childNode)
            
            XCTAssert(node.children.count == 1)
        }
        
        
    }
}
