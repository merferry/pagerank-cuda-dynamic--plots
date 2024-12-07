set term pdf
set terminal pdf size 10in,2.5in
set output 'compare-speedup.pdf'


## Set global styles
set termoption dashed
set datafile separator ','
set style fill solid border lt -1
set style textbox opaque noborder
set xtics rotate by 30 right
set key above font ",12"
set ylabel  '{/:Bold Speedup}'
set logscale y
set grid y


## Draw plot
plot "compare.csv" \
     using ( $4/ $2):xtic(1) title 'Hornet (Static)'   with histogram fill pattern 3, \
  '' using ( $6/ $2):xtic(1) title 'Gunrock (Static)'  with histogram fill pattern 3 ls 4, \
  '' using ($0-2.5/20):( $4/ $2):($4/$2 >= 2? sprintf("%.1f",  $4/ $2) : "") with labels textcolor rgb 'white' rotate by 90 offset character 0,-1 title '', \
  '' using ($0-2.5/20):( $4/ $2):($4/$2  < 2? sprintf("%.1f",  $4/ $2) : "") with labels textcolor rgb 'black' rotate by 90 offset character 0,1 title '', \
  '' using ($0+2.5/20):( $6/ $2):($6/$2 >= 2? sprintf("%.1f",  $6/ $2) : "") with labels rotate by 90 offset character 0,-1 title '', \
  '' using ($0+2.5/20):( $6/ $2):($6/$2  < 2? sprintf("%.1f",  $6/ $2) : "") with labels rotate by 90 offset character 0,1 title ''




## Columns in CSV file.
# 1. graph
# 2. stac-t
# 3. stac-e
# 4. cuhornet-t
# 5. cuhornet-e
# 6. gunrock-t
# 7. gunrock-e
