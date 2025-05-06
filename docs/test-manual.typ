#import "template.typ" as template: *
#import "/src/lib.typ" as PACKAGE

#let src = ````typ
/// A default name to greet
///
/// -> content
#let world = [World]

/// Greets someone @@greet()
/// #context text.size
///
/// ```example
/// = Heading
///
/// #greet[World]
/// #context text.size
/// ```
///
/// ```typ
/// #greet[World]
/// ```
///
/// #test(
///   `1 == 1`,
/// )
///
/// -> content
#let greet(
  /// The name of the one to greet
  ///
  /// -> content
  name,
) = [Hello #name]
````.text
#let (world, greet) = eval(mode: "code", "(() => [\n" + src + "\n#return (world, greet)])()")

#show: manual(
  package-meta: toml("/typst.toml").package,
  // date: none,
  // date: datetime(year: ..., month: ..., day: ...)
  date: datetime.today(),

  logo: rect(width: 5cm, height: 5cm),
  abstract: [
    A PACKAGE for something #lorem(80)
  ],

  scope: (PACKAGE: PACKAGE, world: world, greet: greet),
)

= Introduction

This is a PACKAGE for something, providing #ref-fn("greet()") and #ref-fn("world").
#context text.size

```example
= Heading

#greet[World]
#context text.size
```

#preview-block[
  = Heading

  #greet[World]
  #context text.size
]

= Module reference

#module(
  src,
  name: "PACKAGE",
  label-prefix: none,
)
