public import Either
public import Optic
public import Parser
public import Parser_Map

extension Parser::Parser.`Protocol`
where
    Self: ~Copyable,
    Input: ~Copyable & ~Escapable,
    Output: ~Copyable & ~Escapable
{

    @inlinable
    public consuming func map<
        Source: ~Copyable & ~Escapable,
        Target: ~Copyable & Escapable,
        Focus: ~Copyable & Escapable,
        Replacement: ~Copyable & ~Escapable
    >(
        matching prism: Optic::Optic<
            Source,
            Target,
            Focus,
            Replacement
        >.Prism
    ) -> Parser::Parser.Map<Self, Either<Target, Focus>, Failure>
    where Output == Source {
        map(prism.match)
    }

    @inlinable
    public consuming func map<
        Source: ~Copyable & ~Escapable,
        Target: ~Copyable & Escapable,
        Focus: ~Copyable & Escapable,
        Replacement: ~Copyable & ~Escapable
    >(
        matching prism: Optic::Optic<
            Source,
            Target,
            Focus,
            Replacement
        >.Prism,
        failure transform: @escaping (consuming Target) -> Never
    ) -> Parser::Parser.Map<Self, Focus, Never>
    where Output == Source, Failure == Never {
        map { source in
            switch prism.match(source) {
            case .left(let target):
                transform(target)
            case .right(let focus):
                focus
            }
        }
    }

    @inlinable
    public consuming func map<
        Source: ~Copyable & ~Escapable,
        Target: ~Copyable & Escapable,
        Focus: ~Copyable & Escapable,
        Replacement: ~Copyable & ~Escapable
    >(
        matching prism: Optic::Optic<
            Source,
            Target,
            Focus,
            Replacement
        >.Prism,
        failure transform: @escaping (consuming Target) -> Never
    ) -> Parser::Parser.Map<Self, Focus, Failure>
    where Output == Source {
        map { source in
            switch prism.match(source) {
            case .left(let target):
                transform(target)
            case .right(let focus):
                focus
            }
        }
    }

    @inlinable
    public consuming func map<
        Source: ~Copyable & ~Escapable,
        Target: ~Copyable & Escapable,
        Focus: ~Copyable & Escapable,
        Replacement: ~Copyable & ~Escapable,
        MatchFailure: Swift.Error
    >(
        matching prism: Optic::Optic<
            Source,
            Target,
            Focus,
            Replacement
        >.Prism,
        failure transform: @escaping (consuming Target) -> MatchFailure
    ) -> Parser::Parser.Map<Self, Focus, MatchFailure>
    where Output == Source, Failure == Never {
        map { source throws(MatchFailure) in
            switch prism.match(source) {
            case .left(let target):
                throw transform(target)
            case .right(let focus):
                return focus
            }
        }
    }

    @_disfavoredOverload
    @inlinable
    public consuming func map<
        Source: ~Copyable & ~Escapable,
        Target: ~Copyable & Escapable,
        Focus: ~Copyable & Escapable,
        Replacement: ~Copyable & ~Escapable,
        MatchFailure: Swift.Error
    >(
        matching prism: Optic::Optic<
            Source,
            Target,
            Focus,
            Replacement
        >.Prism,
        failure transform: @escaping (consuming Target) -> MatchFailure
    ) -> Parser::Parser.Map<
        Self,
        Focus,
        Either<Failure, MatchFailure>
    >
    where Output == Source {
        map { source throws(MatchFailure) in
            switch prism.match(source) {
            case .left(let target):
                throw transform(target)
            case .right(let focus):
                return focus
            }
        }
    }

    @inlinable
    public consuming func map<
        Source: ~Copyable & ~Escapable,
        Target: ~Copyable & Escapable,
        Focus: ~Copyable & Escapable,
        Replacement: ~Copyable & ~Escapable
    >(
        embedding prism: Optic::Optic<
            Source,
            Target,
            Focus,
            Replacement
        >.Prism
    ) -> Parser::Parser.Map<Self, Target, Failure>
    where Output == Replacement {
        map(prism.embed)
    }
}
