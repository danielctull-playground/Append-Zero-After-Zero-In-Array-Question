
extension Sequence where Element: Equatable {

    public func pair(_ element: Element, with other: Element) -> PairedWithSequence<Self> {
        PairedWithSequence(base: self, element: element, other: other)
    }
}

public struct PairedWithSequence<Base>: Sequence where Base: Sequence, Base.Element: Equatable {
    let base: Base
    let element: Base.Element
    let other: Base.Element

    public func makeIterator() -> Iterator {
        Iterator(base: base.makeIterator(), element: element, pair: other)
    }

    public struct Iterator: IteratorProtocol {

        enum State {
            case element
            case pair
        }

        var base: Base.Iterator
        var state = State.element
        let element: Base.Element
        let pair: Base.Element

        public mutating func next() -> Base.Element? {

            switch state {
            case .element:
                guard let next = base.next() else { return nil }
                if next == element { state = .pair }
                return next
            case .pair:
                state = .element
                return pair
            }
        }
    }
}
