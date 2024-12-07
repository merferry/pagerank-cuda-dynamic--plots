set term pdf
set terminal pdf size 10in,2.5in
set output 'compare-error.pdf'


## Set global styles
set termoption dashed
set datafile separator ','
set style fill solid border lt -1
set style textbox opaque noborder
set xtics rotate by 30 right
set key above font ",12"
set ylabel  '{/:Bold Error}'
set format y "10^{%L}"
set logscale y
set grid y


## Draw plot
plot "compare.csv" \
     using ( $5):xtic(1) title 'Hornet (Static)'   with histogram fill pattern 3, \
  '' using ( $7):xtic(1) title 'Gunrock (Static)'  with histogram fill pattern 3 ls 4, \
  '' using ( $3):xtic(1) title 'Ours (Static)'     with histogram fill pattern 3 ls 6




## Columns in CSV file.
# 1. graph
# 2. stac-t
# 3. stac-e
# 4. cuhornet-t
# 5. cuhornet-e
# 6. gunrock-t
# 7. gunrock-e
