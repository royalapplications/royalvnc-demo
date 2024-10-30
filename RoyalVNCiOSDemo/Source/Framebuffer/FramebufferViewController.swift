import Foundation
import UIKit

import RoyalVNCKit

protocol FramebufferViewController: UIViewController {
	var framebufferSize: CGSize { get }
	
	var scaleRatio: CGFloat { get }
	var contentRect: CGRect { get }
	
//	var lastModifierFlags: NSEvent.ModifierFlags { get set }
	
	var framebufferViewControllerDelegate: FramebufferViewControllerDelegate? { get set }
	
    func framebufferDidUpdate(_ framebuffer: VNCFramebuffer,
                              x: UInt16, y: UInt16,
                              width: UInt16, height: UInt16)
}

extension FramebufferViewController {
	func frameSizeExceedsFramebufferSize(_ frameSize: CGSize) -> Bool {
		return frameSize.width >= framebufferSize.width &&
			   frameSize.height >= framebufferSize.height
	}
	
	func handleKeyPress(_ key: VNCKeyCode) {
		handleKeyDown(key)
		handleKeyUp(key)
	}
	
	func handleKeyDown(_ key: VNCKeyCode) {
		framebufferViewControllerDelegate?.framebufferViewController(self,
																	 keyDown: key)
	}
	
	func handleKeyUp(_ key: VNCKeyCode) {
		framebufferViewControllerDelegate?.framebufferViewController(self,
																	 keyUp: key)
	}
}
