set term pdf
set terminal pdf size 4in,3.6in
set output '8020-runtime-mean.pdf'


## Set global styles
set termoption dashed
set datafile separator ','
set style fill solid border lt -1
set style textbox opaque noborder
set xtics rotate by 45 right
set format x "10^{%L}"
set grid y
set key above font ",12"


## Set line styles
set style line  1 linewidth 2 linetype 6 pointtype 5 dashtype 1
set style line  2 linewidth 2 linetype 7 pointtype 9 dashtype 1
set style line  3 linewidth 2 linetype 2 pointtype 2 dashtype 1
set style line  4 linewidth 2 linetype 8 pointtype 3 dashtype 1
set style line  5 linewidth 2 linetype 8 pointtype 3 dashtype 2


## Draw plot
set logscale x 10
set logscale y 10
set xlabel  '{/:Bold Batch fraction}'
set ylabel  '{/:Bold Runtime (s)}'
plot '8020.csv' \
     using 4:($10/1000) title 'Static' linestyle  1 with linespoints, \
  '' using 4:($11/1000) title 'ND'     linestyle  2 with linespoints, \
  '' using 4:($12/1000) title 'DT'     linestyle  3 with linespoints, \
  '' using 4:($13/1000) title 'DF'     linestyle  4 with linespoints, \
  '' using 4:($14/1000) title 'DF-P'   linestyle  5 with linespoints, \
  '' using 4:($10/1000):($4==1e-7? sprintf("%.2f", $10/$10) : "") with labels notitle offset character 2.2,character 0.6 textcolor linetype 6, \
  '' using 4:($10/1000):($4>=1e-6 && $4 <1e-5? sprintf("%.2f", $10/$10) : "") with labels notitle offset character 0,character 0.8 textcolor linetype 6, \
  '' using 4:($11/1000):($4==1e-7? sprintf("%.2f", $10/$11) : "") with labels notitle offset character 1.8,character 0.8 textcolor linetype 7, \
  '' using 4:($11/1000):($4==1e-6? sprintf("%.2f", $10/$11) : "") with labels notitle offset character -0.6,character -0.6 textcolor linetype 7, \
  '' using 4:($11/1000):($4>=1e-5 && $4 <1e-4? sprintf("%.2f", $10/$11) : "") with labels notitle offset character -3.0,character -0.6 textcolor linetype 7, \
  '' using 4:($11/1000):($4==1e-3? sprintf("%.2f", $10/$11) : "") with labels notitle offset character -2.2,character -0.6 textcolor linetype 7, \
  '' using 4:($11/1000):($4==1e-2? sprintf("%.2f", $10/$11) : "") with labels notitle offset character 0,character -0.6 textcolor linetype 7, \
  '' using 4:($11/1000):($4==1e-1? sprintf("%.2f", $10/$11) : "") with labels notitle offset character -2.2,character -0.7 textcolor linetype 7, \
  '' using 4:($12/1000):($4==1e-7? sprintf("%.2f", $10/$12) : "") with labels notitle offset character 1.8,character 0.6 textcolor linetype 2, \
  '' using 4:($12/1000):($4>=1e-6 && $4 <1e-2? sprintf("%.2f", $10/$12) : "") with labels notitle offset character 0.0,character 0.7 textcolor linetype 2, \
  '' using 4:($12/1000):($4==1e-1? sprintf("%.2f", $10/$12) : "") with labels notitle offset character -4.2,character 1.2 textcolor linetype 2, \
  '' using 4:($13/1000):($4==1e-7? sprintf("%.2f", $10/$13) : "") with labels notitle offset character 2.2,character -0.4 textcolor linetype 8, \
  '' using 4:($13/1000):($4>=1e-6 && $4 <1e-4? sprintf("%.2f", $10/$13) : "") with labels notitle offset character 0.2,character -0.8 textcolor linetype 8, \
  '' using 4:($13/1000):($4>=1e-4 && $4 <1e-3? sprintf("%.2f", $10/$13) : "") with labels notitle offset character 0,character -0.7 textcolor linetype 8, \
  '' using 4:($13/1000):($4==1e-3? sprintf("%.2f", $10/$13) : "") with labels notitle offset character 2.2,character -1.3 textcolor linetype 8, \
  '' using 4:($13/1000):($4==1e-2? sprintf("%.2f", $10/$13) : "") with labels notitle offset character 2.2,character -0.4 textcolor linetype 8, \
  '' using 4:($13/1000):($4==1e-1? sprintf("%.2f", $10/$13) : "") with labels notitle offset character -2.2,character -0.7 textcolor linetype 8, \
  '' using 4:($14/1000):($4==1e-7? sprintf("%.2f", $10/$14) : "") with labels notitle offset character 2.5,character 0 textcolor linetype 8, \
  '' using 4:($14/1000):($4==1e-6? sprintf("%.2f", $10/$14) : "") with labels notitle offset character 0,character 0.7 textcolor linetype 8, \
  '' using 4:($14/1000):($4==1e-5? sprintf("%.2f", $10/$14) : "") with labels notitle offset character 0,character 1.4 textcolor linetype 8, \
  '' using 4:($14/1000):($4>=1e-4 && $4 <1e-1? sprintf("%.2f", $10/$14) : "") with labels notitle offset character 0,character 0.7 textcolor linetype 8, \
  '' using 4:($14/1000):($4==1e-1? sprintf("%.2f", $10/$14) : "") with labels notitle offset character -1.8,character 0.7 textcolor linetype 8




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
