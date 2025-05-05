# First steps into typing Mini Python

The very first step of this project: **read carefully and understand
the abstract syntax trees involved in this project!**

In OCaml, these are located in file `ast.ml`; in Java, in file
`Syntax.java`.

You should understand well the abstract syntax tree the parser is
producing, since this is the input for the typing phase.

In OCaml, you are supposed to translate a value of type `file`, which
is defined as a `def list * stmt`. This means a file is a pair
composed of a list of `def`, which are the functions defined in a
`.py` file, and a final statement, which you can view as an implicit
"main" function.

In Java, the parser yields an object of class `File`, which contains
two fields: `l`, a linked list of objects of class `Def`, and `s`, the
"main" statement.

*Important note:* both in Java as in OCaml, the "main" statement is
always encoded as a block of statements, even if there is only one
such statement.

The target of the typing phase is a value of type `tfile`, for OCaml,
and an object of class `TFile`, for Java. These represent the concept
of a "typed file". In OCaml, `tfile` is defined as follows:

```ocaml
and tfile = tdef list
```

In Java, `TFile` is defined as follows:

```java
class TFile {
  final LinkedList<TDef> l;

  TFile() {
    super();
    this.l = new LinkedList<>();
  }
}
```

Note that both typed files are now simply "a list of typed
definitions". This means that you have indeed created a new function
"main" for the global statement that we had after parsing.

## Your first typed file

Since a typed file is just "a list of *something*", a very simple (and
always correct!) typed file is just the empty list.

In OCaml, you can do this as follows:

```ocaml
  let file ?debug:(b=false) (p: Ast.file) : Ast.tfile =
    debug := b;
    []
```

In Java:

```java
  static TFile file(File f) {
    return new TFile();
  }
```
