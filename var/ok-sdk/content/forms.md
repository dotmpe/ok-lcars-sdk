# Forms: a catalog for Okudagram layout types

Arguably the diagrams of subject here are purely aesthetic productions, made
originally to look good on TV. This original style reportedly (need cite here)
is ultimately inspired by Art Nouveau decorative forms, combined with the
lithographic tech at hand to make extremely large panel illustrations look
like computer interfaces. And that turned out to be big 'Kodalith' film
transparencies, enlarged from smaller printed computer designs. AFAIK... For
later props and on-screen graphics, printed transparencies have been used on
small CABIN lightpanels. But the kodaliths with some initial lighting issues
worked out are gourgeous high-contrast diagrams, and often even included
on-set animation using polamotion (polarized films and spinning disks). 

Of the original Art Nouveau there isn't much left. IIRC during the initial
seasons curved lines and 'frames' still could do a bit more interesting things
than "caps", "elbows" and a few other more or less abstract forms. Re-watching
TNG though it looks like the basic rules of a standardized LCARS "lexicon" 
where more or less refined already before the initial show, and stayed stable
for the duration of the 90s series.


## Form 1.1.

Two pill bars and a content pane.

## Form 1.2.

Variants with elbows connecting a frame around a content pane.
The two basic variations are determined by the relative sizing of the bars:
a thick column/thin row, or a thin column/thick row.
There is however also a variation with no elbow rounding, and another where
sizing on both bars is of the same weight.

If we leave out two borders, we can focus developing layouts and styling
composites of just the elbow and one bar. To create a basic form we require
four instances of that component with different orientation/direction
parameters. This basic composite also provides for a convenient base for more
complex forms.

## Form 1.3.

The horizontal split at 1/3 from the top and half the frame hidden results in
the canonical "LCARS" form.

Somewhat variant on the basic form 1.2 except with the offset split, 
and separating two content panes.
So really its two 1.2 forms in a column with specific frame config.

The bordering frame bars are often overlayed with details connecting the two.

## Form 2.1

At some point will want to look not just at nesting variants of the above,
but at integrating several frames in snaking patterns. This should easily be
done using state of the art CSS properties, but making such thing metadata
driven is a bit more challenging.
