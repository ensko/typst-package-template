#import "template.typ" as template: *
#import "/src/lib.typ" as PACKAGE

#show: manual(
  package-meta: toml("/typst.toml").package,
  date: none,
  // date: datetime(year: ..., month: ..., day: ...)

  // logo: rect(width: 5cm, height: 5cm),
  // abstract: [
  //   A PACKAGE for something
  // ],
)

// the scope for evaluating expressions and documentation
#let scope = (PACKAGE: PACKAGE)

= Introduction

This is a PACKAGE for something.

= Module reference

#module(
  read("/src/lib.typ"),
  name: "PACKAGE",
  label-prefix: none,
  scope: scope,
)
