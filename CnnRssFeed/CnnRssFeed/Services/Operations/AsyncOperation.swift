import Foundation


enum Result<Value, Error: Swift.Error> {
    case success(Value)
    case failure(Error)
}

class AsyncOperation: Operation {
    private var _executing = false
    private var _finished = false
    
    override var isAsynchronous: Bool {
        return true
    }
    
    override var isExecuting: Bool {
        return _executing
    }
    override var isFinished: Bool {
        return _finished
    }
    
    override func start() {
        guard !isCancelled else {
            finish()
            return
        }
        willChangeValue(forKey: "isExecuting")
        _executing = true
        main()
        didChangeValue(forKey: "isExecuting")
    }
    
    override func main() {
        fatalError("Should be overriden")
    }
    
    func finish() {
        willChangeValue(forKey: "isFinished")
        willChangeValue(forKey: "isExecuting")
        _finished = true
        _executing = false
        didChangeValue(forKey: "isFinished")
        didChangeValue(forKey: "isExecuting")
    }
}
