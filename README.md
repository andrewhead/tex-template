For reason I am not sure of, this project requires 4 compilations, where 2 of
those will yield compilation errors, to successfully print out all references.

The anticipated workflow for integrating this into a LaTeX project is...

1. Add 'macros.tex' as a input in the main LaTeX file
2. Set the bibligraphy to use 'references.bib' as references (I recommend
   considering that file "read-only" and then using a separate bibliography file
   all references that will be edited or added, so that they can be incorporated
   individually back into references.bib later
3. Update the '.bst' file for the project to do the kind of styling we want. For
   my projects, this usually means leaving out the '(n.d.)' "no-date" specifier
   from bibliography entries that do not have years, and also making sure that
   just the title (and not the key, which should only be used for shorting)
   appears for "online" entries (in the "manual" section). To figure out what
   kind of edits might be necessary to the '.bst' file, call
   `diff ACM-Reference-Format.bst.orig ACM-Reference-Format.bst`
4. You may want to scan the example 'main.tex' file for additional macros and helpers
   that could not work in the 'macros.tex' file (namely because they would
   need to be used before '\input' will typically be run on the macros file).
