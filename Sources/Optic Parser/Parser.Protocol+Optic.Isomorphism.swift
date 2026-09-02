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
        forward isomorphism: Optic::Optic<
            Source,
            Target,
            Focus,
            Replacement
        >.Isomorphism
    ) -> Parser::Parser.Map<Self, Focus, Failure>
    where Output == Source {
        map(isomorphism.forward)
    }
}
