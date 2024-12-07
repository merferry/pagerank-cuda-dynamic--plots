set term pdf
set terminal pdf size 10in,2.5in
set output 'compare-runtime.pdf'


## Set global styles
set termoption dashed
set datafile separator ','
set style fill solid border lt -1
set style textbox opaque noborder
set xtics rotate by 30 right
set key above font ",12"
set ylabel  '{/:Bold Runtime (s)}'
set logscale y
set grid y


## Draw plot
plot "compare.csv" \
     using ( $4/1000):xtic(1) title 'Hornet (Static)'   with histogram fill pattern 3, \
  '' using ( $6/1000):xtic(1) title 'Gunrock (Static)'  with histogram fill pattern 3 ls 4, \
  '' using ( $2/1000):xtic(1) title 'Ours (Static)'     with histogram fill pattern 3 ls 6, \
  '' using ($0-4.0/20):( $4/1000):(sprintf("%.1f",  $4/1000)) with labels textcolor rgb 'white' rotate by 90 offset character 0,-1 title '', \
  '' using ($0+0.0/20):( $6/1000):($6/1000 >= 0.2? sprintf("%.1f",  $6/1000) : "") with labels rotate by 90 offset character 0,-1 title '', \
  '' using ($0+0.0/20):( $6/1000):($6/1000 <  0.2? sprintf("%.2f",  $6/1000) : "") with labels rotate by 90 offset character 0,-1 title '', \
  '' using ($0+4.0/20):( $2/1000):($2/1000 >= 0.1? sprintf("%.2f",  $2/1000) : "") with labels textcolor rgb 'white' rotate by 90 offset character 0,-1 title '', \
  '' using ($0+4.0/20):( $2/1000):($2/1000 <  0.1? sprintf("%.2f",  $2/1000) : "") with labels textcolor rgb 'black' rotate by 90 offset character 0,1 title ''




## Columns in CSV file.
# 1. graph
# 2. stac-t
# 3. stac-e
# 4. cuhornet-t
# 5. cuhornet-e
# 6. gunrock-t
# 7. gunrock-e
