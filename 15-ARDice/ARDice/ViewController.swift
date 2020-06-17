//
//  ViewController.swift
//  ARDice
//
//  Created by Esraa Gamal on 6/16/20.
//  Copyright © 2020 Esraa. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    var diceArray = [SCNNode]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the view's delegate
        sceneView.delegate = self
        
        sceneView.autoenablesDefaultLighting = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        configuration.planeDetection = .horizontal
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //let touch equal the first touch in the screen
        if let touch = touches.first{
            //grab the location of the touched place
            let touchLocation = touch.location(in: sceneView)
            
            let results = sceneView.hitTest(touchLocation, types: .existingPlaneUsingExtent)
            if let hitResult = results.first {
                //add die to the location
               addDice(atLocation: hitResult)
                    
                }
            }
        }
    
    
    func addDice(atLocation location: ARHitTestResult){
        //use the 3d model dicee.scn
        let diceSscene = SCNScene(named: "art.scnassets/dicee.scn")!
        // make a node for the die
           if let diceNode = diceSscene.rootNode.childNode(withName: "Dice", recursively: true){
            //place it in the choosen location where the user touched before
               diceNode.position = SCNVector3(
                   location.worldTransform.columns.3.x,
                   //make the dice above the planeAnchor
                   location.worldTransform.columns.3.y + diceNode.boundingSphere.radius,
                   location.worldTransform.columns.3.z)
            
            //add the die to the dice array
               diceArray.append(diceNode)
            
            //add die node to the scene
               sceneView.scene.rootNode.addChildNode(diceNode)
            
            //roll the die
            roll(dice: diceNode)
            
        }
    }
    func rollAll (){
        //roll all existing dice
        if !diceArray.isEmpty{
            for die in diceArray{
                roll(dice: die)
            }
        }
    }
    
    func roll(dice: SCNNode){
      
        //create a random x and z
        let randomX = Float((arc4random_uniform(4) + 1)) * (Float.pi/2)
        let randomZ = Float((arc4random_uniform(4) + 1)) * (Float.pi/2)
        
        //rotate die to the random x and z
        dice.runAction(SCNAction.rotateBy(x: CGFloat(randomX * 5), y: 0, z: CGFloat(randomZ * 5), duration: 0.5))
        
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        //state a planceAnchor -horizontal-
        let planeAnchor = anchor as! ARPlaneAnchor
        //create a plane
        let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
        //make a node for the plane
        let planeNode = SCNNode()
        planeNode.position = SCNVector3(planeAnchor.center.x, 0, planeAnchor.center.z)
        planeNode.transform = SCNMatrix4MakeRotation(-Float.pi/2, 1, 0, 0)
        let gridMaterial = SCNMaterial()
        gridMaterial.diffuse.contents = UIImage(named: "art.scnassets/grid.png")
        plane.materials = [gridMaterial]
        planeNode.geometry = plane
        node.addChildNode(planeNode)
        
    }
    
    @IBAction func rollAgain(_ sender: UIBarButtonItem) {
        rollAll()
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        //roll when the phone is shaked
        rollAll()
    }
    @IBAction func removeAll(_ sender: UIBarButtonItem) {
        //remove all dice
        if !diceArray.isEmpty{
            for dice in diceArray{
                dice.removeFromParentNode()
            }
        }
    }
}
