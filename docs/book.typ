#import "@preview/haita:0.3.0" as haita: *

#import "/src/lib.typ" as PACKAGE
#import "template.typ": set-info

#set-info(
  package-meta: toml("/typst.toml").package,
  scope: (PACKAGE: PACKAGE),
)

#let chapter(path, filename: auto, content: auto, ..args) = haita.chapter(
  path,
  content: {
    if content != auto {
      content
    } else {
      let filename = if filename != auto { filename } else { path }
      include "book/" + filename + ".typ"
    }
  },
  ..args,
)

#let name = toml("/typst.toml").package.name

#book(
  title: name,
  canonical-url: "https://docs.ensko.at",
  root: name,

  // This sets your html renderer. You can customize the HTML renderer
  // using `html-renderer.with(...)`, or write your own!
  html-renderer: new-hamber.html-renderer.with(
    sidebar-image: {
      show: html.h1.with(class: "p-4 text-xl font-bold italic")
      link("/" + name)[#name]
    },
    pagefind-enabled: true,
    footer-content: [
      Powered by #link("https://github.com/wensimehrp/haita")[Haita].
    ],
  ),
  // Your document's contents
  tree: (
    chapter("index", filename: "introduction"),

    [= Chapter],
    chapter("chapter/section"),
    chapter("chapter/api"),
  ),
)

