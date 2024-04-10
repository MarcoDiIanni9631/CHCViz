# SmartContractToGraph
This repository contains the code to transform a Smart Contract into a Predicate dependency graph.

## Features

The toolchain performs the following operations:

1. Compiles a Solidity contract into an SMT-LIB query using SolCMC.
2. Translates the SMT-LIB query into Prolog Eldarica.
3. Analyzes the resulting Prolog code, resolving any issues related to variables, points, and predicate checks.
4. Converts the analyzed Prolog code into a .dot file using Logtalk.
5. Generates an SVG diagram from the .dot file using Graphviz.

## Dependencies

Before running the toolchain, make sure you have the following software installed on your system:

- SOLC
- Scala
- Eldarica (pre-requisite Scala)
- Logtalk
- Graphviz

## Usage

1. Clone the repository:

```bash
git clone https://github.com/MarcoDiIanni9631/SmartContractToGraph/
