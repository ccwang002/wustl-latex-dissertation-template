# Dissertation and Thesis Template

This is a LaTeX version of the dissertation and thesis template for The Graduate School at Washington University in St. Louis. (https://provost.wustl.edu/vpge/phd-education-and-governance/)

Template version: August (July) 2022


## About

This document contains the guidelines for the proper formatting of dissertations and theses for doctoral and master’s degree-seeking students within the Graduate School at Washington University in St. Louis.
The document is formatted using the same guidelines it describes.
Consequently, by making an extra copy of this document, you can use it as a template in which you can replace the original text with your own while still retaining the general formatting.

It is a good idea to read through this document carefully before you save it as a template and begin.
Please remember that all doctoral and master’s students are ultimately responsible for meeting the Graduate School (GS) formatting guidelines.
If there is a particular issue that is not found in this template or the Dissertation/Thesis Guide, your committee or discipline should decide how it will be addressed.

Be certain to use your own full name (as recorded in [WebSTAC](https://acadinfo.wustl.edu/)) where appropriate.
Make sure you use the month and year your degree is officially to be earned on the title page, abstract page and, if included, vita page(s).

Once completed, you will need to submit your document as a PDF electronically, as per the [Doctoral Dissertation Guide](https://wustl.box.com/s/16rx96n2hupwg7uuepwsjerzafer36pl) and [Master’s Thesis Guide](https://wustl.box.com/s/mkuomxb82o2cjlpbdr5sqnlhq9xiiov7), which also can be found on the school website.

Since 2022, the graduate school's official template has removed any mentioning of the formatting of master's thesis.
This template has been updated to match the latest version, though it is still compatible to the formatting of master's thesis.
The template for master's thesis can be found in [the template made by the School of McKelvey Engineering](https://wustl.box.com/s/b6mvyjeo47gb2nd49bxhqq4j6t8in6w0).


## How to Use this Template

This template is a LaTeX version of The Graduate School's Microsoft Word template. To use, make a copy all of the files (or fork this repository) and start replacing the contents with your dissertation or thesis.

You will need a TeX Live installation (2020 and later) with LuaLaTeX for this template.
If you use the BasicTeX distribution with only minimal packages, install the additional packages below:

    sudo tlmgr install \
        latexmk \
        biber biblatex biblatex-nature \
        csquotes \
        lualatex-math stix2-otf \
        emoji \
        threeparttable makecell \
        enumitem

The bibliography is managed by [Biber] and [BibLaTeX] (not BibTeX).
BibLaTeX is considered a replacement for BibTeX and supports special characters (Unicode) and URLs in citations.

LaTeX document compilation is automated by [Latexmk].
Latexmk compiles LaTeX documents the correct number of times.
Many makefiles for LaTeX documents often compile twice.
Sometimes this is unnecessary, other times it is not enough.
Latexmk will correctly determine the number of compilations necessary to produce a correct document.

This template also sets up a GitHub Workflow that automatically builds PDF online when the status of this badge says passing: [![Build LaTeX PDF status](https://github.com/ccwang002/wustl-latex-dissertation-template/actions/workflows/build_latex.yml/badge.svg)][workflow-status].
Once you fork this repository and push new commits to GitHub, the workflow will be triggered and compiles the PDF.
The PDF is available as a workflow artifact (see [GitHub's doc][github-artifact-doc]).

[Biber]: http://biblatex-biber.sourceforge.net/
[BibLaTeX]: https://www.ctan.org/pkg/biblatex
[Latexmk]: https://www.ctan.org/pkg/latexmk/
[workflow-status]: https://github.com/ccwang002/wustl-latex-dissertation-template/actions
[github-artifact-doc]: https://docs.github.com/en/actions/managing-workflow-runs/downloading-workflow-artifacts


## Compiling the Document

To compile, `latexmk -lualatex thesis.tex`

To clean build files but not the compiled document: `latexmk -c`

To clean all files including the compiled document: `latexmk -C`


## Differences to the Word Template

While this template fully complies with the school's style guide, there are some differences to the official word template.
Please compare the compiled output at [`thesis_demo.pdf`] to the official template at [`guide/dissertation_and_thesis_template_2022.pdf`][template_pdf].

[`thesis_demo.pdf`]: https://github.com/ccwang002/wustl-latex-dissertation-template/blob/master/thesis_demo.pdf
[template_pdf]: https://github.com/ccwang002/wustl-latex-dissertation-template/blob/master/guide/dissertation_and_thesis_template_2022.pdf

Notable changes:
- No underline in chapter titles
- Header margins and font sizes are different


## Contributing
*Please help keep this template up to date with The Graduate School's Microsoft Word template.*

If you would like to submit changes to this template, please fork this repository and submit a pull request.


## License
LaTeX Project Public License version 1.3.


## Change Log
2024-07-07:
- Update GitHub Workflow dependencies

2023-01-30:
- Add environments for supplemental figures and tables

2022-10-16:
- Update to follow the 2022 edition of the official template
- Make formatting changes in the title page and abstract

2022-03-12:
- Update the example of this template

2021-11-01:
- Tweak typography
- Use microtype to adjust text kerning

2021-09-16:
- Rewrite of the original `wuthesis.cls` file using memoir package


## Origin of this template

The template was rewritten by Liang-Bo Wang in 2021 based on Kyle J. Harms (`@harmsk`)'s GitHub repo [harmsk/wustl-latex-dissertation-template].
Due to the likely incompatibility and style changes, the document class was renamed from `wuthesis.cls` to `wustlthesis.cls`.
Given this was a full rewrite, the author took the liberty of choosing a permissive license.
Please let us know if there is any copyright infringement or license incompatibility.

While it's difficult to fully trace the origins of `wuthesis.cls`, based on the file comments, Kevin Ruland created the first version of the WashU Sever Institute thesis class `wuthesis.dtx` (later converted to `wuthesis.cls`) in 1995 based on UT Austin's Thesis Style File v2 by Dinesh Das in 1995.
Revisions were made by Long Duan in 1996, by Greg Hackmann in 2005, 2007, and 2008, and finally by Michael Hall, David Lu in 2014.
The git-traceable code was uploaded and modified by Jonathan Beard (`@jonathan-beard`) in [2015][jonathan-beard-fork].
It was then updated to match the school's 2016 official template by Kyle J.
Harms (`@harmsk`), which became the upstream of this fork.

[harmsk/wustl-latex-dissertation-template]: https://github.com/harmsk/wustl-latex-dissertation-template/tree/f5386bb93dee6e5c0c5b1faed317b687be0f199a
[jonathan-beard-fork]:https://github.com/jonathan-beard/wustl_cse_thesis_template
