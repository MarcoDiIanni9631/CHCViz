# SmartContractToGraph

This repository contains the code to transform a Smart Contract into a Predicate dependency graph.

## Features

The toolchain performs the following operations:

1. Compiles a Solidity contract into an SMT-LIB query using SolCMC.
2. Translates the SMT-LIB query into Prolog Eldarica.
3. Analyzes the resulting Prolog code, resolving any issues related to variables and predicates.
4. Converts the analyzed Prolog code into a .dot file using Logtalk.
5. Generates an SVG diagram from the .dot file using Graphviz.

## Dependencies

Before running the toolchain, make sure you have the following software installed on your system:

- SOLC
- Eldarica
- Logtalk
- Graphviz
- SwiProlog

## Usage

To use the toolchain, follow these steps:

1. Install the required dependencies listed above.
2. Add eld as a symbolic link.
3. Clone this repository to your local machine.
4. Navigate to the directory containing the repository.
5. Execute the command `python chcviz.py <solidity_file>`, replacing `<solidity_file>` with the path to the Solidity file you want to convert.
6. After the toolchain completes execution, you will find the generated SVG file containing the predicate dependency graph in the output directory.
