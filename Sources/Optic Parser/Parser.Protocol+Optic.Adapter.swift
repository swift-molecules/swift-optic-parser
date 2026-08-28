public import Optic
public import Parser
public import Parser_Map

extension Parser::Parser.`Protocol` where Self: ~Copyable {

    @inlinable
    public consuming func map<
        Source: ~Copyable & ~Escapable,
        Target: ~Copyable & Escapable,
        Focus: ~Copyable & Escapable,
        Replacement: ~Copyable & ~Escapable,
        BackwardFailure: Swift.Error
    >(
        forward adapter: Optic::Optic<
            Source,
            Target,
            Focus,
            Replacement
        >.Adapter<Never, BackwardFailure>
    ) -> Parser::Parser.Map<Self, Focus, Never>
    where Output == Source, Failure == Never {
        map { source in adapter.forward(source) }
    }

    @inlinable
    public consuming func map<
        Source: ~Copyable & ~Escapable,
        Target: ~Copyable & Escapable,
        Focus: ~Copyable & Escapable,
        Replacement: ~Copyable & ~Escapable,
        BackwardFailure: Swift.Error
    >(
        forward adapter: Optic::Optic<
            Source,
            Target,
            Focus,
            Replacement
        >.Adapter<Never, BackwardFailure>
    ) -> Parser::Parser.Map<Self, Focus, Failure>
    where Output == Source {
        map { source in adapter.forward(source) }
    }

    @inlinable
    public consuming func map<
        Source: ~Copyable & ~Escapable,
        Target: ~Copyable & Escapable,
        Focus: ~Copyable & Escapable,
        Replacement: ~Copyable & ~Escapable,
        ForwardFailure: Swift.Error,
        BackwardFailure: Swift.Error
    >(
        forward adapter: Optic::Optic<
            Source,
            Target,
            Focus,
            Replacement
        >.Adapter<ForwardFailure, BackwardFailure>
    ) -> Parser::Parser.Map<Self, Focus, ForwardFailure>
    where Output == Source, Failure == Never {
        map(adapter.forward)
    }

    @_disfavoredOverload
    @inlinable
    public consuming func map<
        Source: ~Copyable & ~Escapable,
        Target: ~Copyable & Escapable,
        Focus: ~Copyable & Escapable,
        Replacement: ~Copyable & ~Escapable,
        ForwardFailure: Swift.Error,
        BackwardFailure: Swift.Error
    >(
        forward adapter: Optic::Optic<
            Source,
            Target,
            Focus,
            Replacement
        >.Adapter<ForwardFailure, BackwardFailure>
    ) -> Parser::Parser.Map<
        Self,
        Focus,
        Either<Failure, ForwardFailure>
    >
    where Output == Source {
        map(adapter.forward)
    }
}
