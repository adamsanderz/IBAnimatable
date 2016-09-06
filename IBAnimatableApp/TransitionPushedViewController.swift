//
//  Created by Jake Lin on 5/13/16.
//  Copyright © 2016 IBAnimatable. All rights reserved.
//

import UIKit
import IBAnimatable

class TransitionPushedViewController: UIViewController {

  @IBOutlet var gestureLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let animatableView = view as? AnimatableView {
      animatableView.predefinedGradient = generateRandomGradient()
    }
    configureGestureLabel()
  }
}

private extension TransitionPushedViewController {
  
  func configureGestureLabel() {
    // Shows nothing by default
    gestureLabel.text = "to pop"
    
    guard let navigationController = self.navigationController as? AnimatableNavigationController else {
      return
    }
    
    // No gesture for this animator
    guard let interactiveGestureType = navigationController.interactiveGestureType else {
      return
    }
    
    if case .none = navigationController.transitionAnimationType {
      return
    }
    
    gestureLabel.text = retrieveGestureText(interactiveGestureType, transitionAnimationType: navigationController.transitionAnimationType, exit: "pop")
  }
  
}
