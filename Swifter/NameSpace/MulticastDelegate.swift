import Foundation
import UIKit

public enum Relation {
    case strong
    case weak
}

/// 多重代理
open class MulticastDelegate<T> {
    private let delegates: NSHashTable<AnyObject>

    public var count: Int {
        return self.delegates.allObjects.count
    }
    
    public init(relation: Relation = .weak) {
        self.delegates = relation == .strong ? NSHashTable<AnyObject>() : NSHashTable<AnyObject>.weakObjects()
    }
    
    public init(options: NSPointerFunctions.Options) {
        self.delegates = NSHashTable<AnyObject>(options: options, capacity: 0)
    }
	
	public func append(by delegate: T) {
        self.delegates.add(delegate as AnyObject)
	}
    
	public func remove(by delegate: T) {
        self.delegates.remove(delegate as AnyObject)
	}
	
    public func sync(queue: DispatchQueue, invocation: (T) -> ()) {
		for delegate in self.delegates.allObjects {
            queue.sync {
                invocation(delegate as! T)
            }
		}
	}
    
    public func async(queue: DispatchQueue, invocation: @escaping (T) -> ()) {
        for delegate in self.delegates.allObjects {
            queue.async {
                invocation(delegate as! T)
            }
        }
    }

    public func contains(with delegate: T) -> Bool {
        return self.delegates.contains(delegate as AnyObject)
    }
}

public func +=<T>(left: MulticastDelegate<T>, right: T) {
	left.append(by: right)
}

public func -=<T>(left: MulticastDelegate<T>, right: T) {
	left.remove(by: right)
}
