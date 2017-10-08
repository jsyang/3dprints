# Jun Qi - Army Chess

- [Rules and pieces](https://www.ymimports.com/pages/how-to-play-luzhanqi)

## Number of pieces per side:

```
Rank        Title               Count

Rank 1      marshal             1
Rank 2      general             1
Rank 3      lt_general          2
Rank 4      brigadier_general   2
Rank 5      colonel             2
Rank 6      major               2
Rank 7      captain             3
Rank 8      platoon_commander   3
Rank 9      engineer            3

Special     flag                1
Special     landmine            3
Special     grenade             2
```

## Resize and interpolation for higher resolution for `potrace` input.

Using ImageMagick `resize` ["Fill Given Area"](http://www.imagemagick.org/Usage/resize/#fill)

```
( set -x ; for f_png in *.gif ; do f="${f_png%.gif}" ; convert "$f_png" -resize 800x600^ "$f.pnm" && potrace "$f.pnm" -s -qc -o "$f.svg" ; done )
```

## Convert SVG to DXF

__Sadly, this did not work as `pstoedit` created some malformed files.__

```
( set -x ; for f_svg in *.svg ; do f="${f_svg%.dxf}" ; ./svg-to-dxf.pl "$f_svg" ; done )
```