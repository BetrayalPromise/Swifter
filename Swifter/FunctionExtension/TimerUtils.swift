import Foundation
import UIKit

extension Timer {
    private class TimerActionClosureWapper: NSObject {
        var closure: (() -> Void)?
        init(closure: @escaping (() -> Void)) {
            self.closure = closure
        }
    }
    
    class func scheduleTimer(_ time: TimeInterval, closure: @escaping (() -> Void), repeats: Bool) -> Timer {
        return self.scheduledTimer(timeInterval: time, target: self, selector: #selector(timerAction), userInfo: TimerActionClosureWapper(closure: closure), repeats: repeats)
    }
    
    @objc
    class func timerAction(_ timer: Timer) {
        guard let action: TimerActionClosureWapper = timer.userInfo as? TimerActionClosureWapper else {
            return
        }
        action.closure!()
    }
}
