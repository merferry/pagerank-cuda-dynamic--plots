set term pdf
set terminal pdf size 4in,3.6in
set output '8020-runtime-mean.pdf'


## Set global styles
set termoption dashed
set datafile separator ','
set style fill solid border lt -1
set style textbox opaque noborder
set xtics rotate by 45 right
set xrange [:0.1]
set format x "10^{%L}"
set grid y
set key above font ",12"


## Set line styles
set style line  1 linewidth 2 linetype 7 pointtype 9 dashtype 1
set style line  2 linewidth 2 linetype 7 pointtype 9 dashtype 2
set style line  3 linewidth 2 linetype 2 pointtype 2 dashtype 1
set style line  4 linewidth 2 linetype 8 pointtype 3 dashtype 1
set style line  5 linewidth 2 linetype 8 pointtype 3 dashtype 2


## Draw plot
set logscale x 10
set logscale y 10
set xlabel  '{/:Bold Batch fraction}'
set ylabel  '{/:Bold Runtime (s)}'
plot '8020.csv' \
     using 4:($8 /1000) title 'DF CPU'   linestyle  1 with linespoints, \
  '' using 4:($9 /1000) title 'DF-P CPU' linestyle  2 with linespoints, \
  '' using 4:($13/1000) title 'DF GPU'   linestyle  4 with linespoints, \
  '' using 4:($14/1000) title 'DF-P GPU' linestyle  5 with linespoints, \
  '' using 4:($8 /1000):($4==1e-7? sprintf("%.1f", $8/$14 ) : "") with labels notitle offset character 2.2,character 1.4 textcolor linetype 8, \
  '' using 4:($8 /1000):($4>=1e-6 && $4<1e-1? sprintf("%.1f", $8/$14 ) : "") with labels notitle offset character 0.2,character 0.8 textcolor linetype 8, \
  '' using 4:($8 /1000):($4==1e-1? sprintf("%.1f", $8/$14 ) : "") with labels notitle offset character -2,character 0.3 textcolor linetype 8, \
  '' using 4:($9 /1000):($4==1e-7? sprintf("%.1f", $9/$14 ) : "") with labels notitle offset character 1.4,character 1.0 textcolor linetype 8, \
  '' using 4:($9 /1000):($4>=1e-6 && $4<1e-1? sprintf("%.1f", $9/$14 ) : "") with labels notitle offset character 0,character 0.8 textcolor linetype 8, \
  '' using 4:($9 /1000):($4==1e-1? sprintf("%.1f", $9/$14 ) : "") with labels notitle offset character -2,character 0.3 textcolor linetype 8, \
  '' using 4:($13/1000):($4==1e-7? sprintf("%.2f", $13/$14) : "") with labels notitle offset character 2.2,character 0.9 textcolor linetype 8, \
  '' using 4:($13/1000):($4>=1e-6 && $4<1e-1? sprintf("%.2f", $13/$14) : "") with labels notitle offset character -0.4,character 0.7 textcolor linetype 8, \
  '' using 4:($13/1000):($4==1e-1? sprintf("%.2f", $13/$14) : "") with labels notitle offset character -2.8,character 0.4 textcolor linetype 8, \
  '' using 4:($14/1000):($4==1e-7? sprintf("%.1f", $14/$14) : "") with labels notitle offset character 2.5,character -0.2 textcolor linetype 8, \
  '' using 4:($14/1000):($4>=1e-6 && $4<1e-1? sprintf("%.1f", $14/$14) : "") with labels notitle offset character 0,character -0.7 textcolor linetype 8, \
  '' using 4:($14/1000):($4==1e-1? sprintf("%.1f", $14/$14) : "") with labels notitle offset character -2,character -0.7 textcolor linetype 8




## Columns in CSV file.
# 01. graph
# 02. batch_deletions_fraction
# 03. batch_insertions_fraction
# 04. batch_fraction
# 05. stao-t
# 06. naio-t
# 07. trao-t
# 08. froo-t
# 09. fropo-t
# 10. stac-t
# 11. naic-t
# 12. trac-t
# 13. froc-t
# 14. fropc-t
# 15. stao-e
# 16. naio-e
# 17. trao-e
# 18. froo-e
# 19. fropo-e
# 20. stac-e
# 21. naic-e
# 22. trac-e
# 23. froc-e
# 24. fropc-e
