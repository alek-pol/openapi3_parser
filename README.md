# OpenAPI 3 Parser

[![Build Status](https://travis-ci.org/kevindew/openapi3_parser.svg?branch=master)](https://travis-ci.org/kevindew/openapi3_parser)


This is a parser/validator for [Open API 3][openapi-3] built in Ruby.

Example usage:

```
require "openapi3_parser"

document = Openapi3Parser.load_file("path/to/example.yaml")

# check whether document is valid
document.valid?

# traverse document
document.paths["/"]
```

Documentation for the API to navigate the OpenAPI nodes is available on
[rubydoc.info][docs].

[openapi-3]: https://github.com/OAI/OpenAPI-Specification
[docs]: http://www.rubydoc.info/github/kevindew/openapi3_parser/Openapi3Parser/Nodes/Openapi

## Status

This is currently a work in progress and will remain so until it reaches 1.0.

See [TODO](TODO.md) for details of the roadmap there.

## Licence

[MIT License](LICENCE)
