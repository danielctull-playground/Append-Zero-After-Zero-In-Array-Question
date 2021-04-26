
extension Sequence {

    public func limitCount(to numberOfElements: Int) -> LimitedSequence<Self> {
        LimitedSequence(base: self, limit: numberOfElements)
    }
}

public struct LimitedSequence<Base>: Sequence where Base: Sequence {
    let base: Base
    let limit: Int

    public func makeIterator() -> Iterator {
        Iterator(base: base.makeIterator(), limit: limit)
    }

    public struct Iterator: IteratorProtocol {
        var base: Base.Iterator
        var count = 0
        let limit: Int

        public mutating func next() -> Base.Element? {
            guard count < limit else { return nil }
            count += 1
            return base.next()
        }
    }
}
