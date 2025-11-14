// Created with jtex v.1.0.20
#import "lapreprint.typ": *
#show: template.with(
  title: "Introduction to Open Publishing",
  abstract: (
    (
      title: "Abstract",
      content: [
This tutorial introduces open publishing techniques using Jupyter Book and demonstrates how to effectively publish your research.
      ]
    ),
  ),
  subtitle: "Using Jupyter Book for Open Publishing",
  date: datetime(
    year: 2025,
    month: 11,
    day: 14,
  ),
  bibliography-file: "main.bib",
  authors: (
    (
      name: "Qiusheng Wu",
      orcid: "0000-0001-5437-4073",
      affiliations: "1",
    ),
  ),
  affiliations: (
    (
      id: "1",
      name: "University of Tennessee",
    ),
  ),
  margin: (
  ),
)

#import "myst-imports.typ": *

/* Written by MyST v1.6.4 */

Whether you write your book's content in Jupyter Notebooks (`.ipynb`) or in regular markdown files (`.md`), you'll write in the same flavor of markdown called *MyST Markdown*.

= What is MyST? <what-is-myst>

MyST stands for "Markedly Structured Text". It is a slight variation on a flavor of markdown called "CommonMark" markdown, with small syntax extensions to allow you to write *roles* and *directives* in the Sphinx ecosystem.

= What are roles and directives? <what-are-roles-and-directives>

Roles and directives are two of the most powerful tools in Jupyter Book. They are kind of like functions, but written in a markup language. They both serve a similar purpose, but *roles are written in one line*, whereas *directives span many lines*. They both accept different kinds of inputs, and what they do with those inputs depends on the specific role or directive that is being called.

== Using a directive <using-a-directive>

At its simplest, you can insert a directive into your book's content like so:

````
```{mydirectivename}
My directive content
```
````

This will only work if a directive with name `mydirectivename` already exists (which it doesn't). There are many pre-defined directives associated with Jupyter Book. For example, to insert a note box into your content, you can use the following directive:

````
```{note}
Here is a note
```
````

This results in:

#noteBlock[
Here is a note
]

In your built book.

For more information on writing directives, see the #link("https://myst-parser.readthedocs.io/")[MyST documentation].

== Using a role <using-a-role>

Roles are very similar to directives, but they are less-complex and written entirely on one line. You can insert a role into your book's content with this pattern:

```
Some content {rolename}`and here is my role's content!`
```

Again, roles will only work if `rolename` is a valid role's name. For example, the `doc` role can be used to refer to another page in your book. You can refer directly to another page by its relative path.

For more information on writing roles, see the #link("https://myst-parser.readthedocs.io/")[MyST documentation].

== Adding a figure <adding-a-figure>

You can also add figures to your book.

```text
:::{figure} https://assets.gishub.org/images/book-cover.png
:label: gispro-book-cover
:alt: GISPro Book Cover
:align: center
:width: 100%

GIS Programming with Python Book Cover.
:::
```

#show figure: set block(breakable: breakableDefault)
#figure(
  image("files/5869dd046ee5260244096d745ad57672.png", width: 90%),
  caption: [
GIS Programming with Python Book Cover.
],
  kind: "figure",
  supplement: [Figure],
) <gispro-book-cover>

== Adding a citation <adding-a-citation>

You can also cite references that are stored in a `bibtex` file. For example, the following syntax: ```{cite}`holdgraf_evidence_2014` ``` will render like this: #cite(<holdgraf_evidence_2014>, form: "prose").

Multiple citations can be used like this: #cite(<holdgraf_rapid_2016>, form: "prose") #cite(<holdgraf_encoding_2017>, form: "prose")

Moreover, you can insert a bibliography into your page with this syntax: The `{bibliography}` directive must be used for all the `{cite}` roles to render properly. For example, if the references for your book are stored in `references.bib`, then the bibliography is inserted with:

````
```{bibliography}
```
````

Resulting in a rendered bibliography that looks like:

/*
 ```{bibliography}

``` 
*/

== Executing code in your markdown files <executing-code-in-your-markdown-files>

If you'd like to include computational content inside these markdown files, you can use MyST Markdown to define cells that will be executed when your book is built. Jupyter Book uses _jupytext_ to do this.

First, add Jupytext metadata to the file. For example, to add Jupytext metadata to this markdown page, run this command:

```
jupyter-book myst init markdown.md
```

Once a markdown file has Jupytext metadata in it, you can add the following directive to run the code at build time:

````
```{code-cell}
print("Here is some code to execute")
```
````

When your book is built, the contents of any `{code-cell}` blocks will be executed with your default Jupyter kernel, and their outputs will be displayed in-line with the rest of your content.

For more information about executing computational content with Jupyter Book, see #link("https://myst-nb.readthedocs.io/")[The MyST-NB documentation].
