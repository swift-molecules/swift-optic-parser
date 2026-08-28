# swift-optic-parser

Focused directional lifting from Optic into Parser.

`Optic Parser` maps parsed values through Adapter forward application,
Isomorphism forward application, Prism matching, and Prism embedding. Every
operation returns `Parser.Map` and normalizes failure without exposing unused
Optic directions.
