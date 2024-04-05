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
     using ( $2/ $4):xtic(1) title 'Hornet'   with histogram fill pattern 3, \
  '' using ( $3/ $4):xtic(1) title 'Gunrock'  with histogram fill pattern 3 ls 4, \
  '' using ($0-2.5/20):( $2/ $4):($2/$4 >= 2? sprintf("%.1f",  $2/ $4) : "") with labels textcolor rgb 'white' rotate by 90 offset character 0,-1 title '', \
  '' using ($0-2.5/20):( $2/ $4):($2/$4  < 2? sprintf("%.1f",  $2/ $4) : "") with labels textcolor rgb 'black' rotate by 90 offset character 0,1 title '', \
  '' using ($0+2.5/20):( $3/ $4):($3/$4 >= 2? sprintf("%.1f",  $3/ $4) : "") with labels rotate by 90 offset character 0,-1 title '', \
  '' using ($0+2.5/20):( $3/ $4):($3/$4  < 2? sprintf("%.1f",  $3/ $4) : "") with labels rotate by 90 offset character 0,1 title ''




## Columns in CSV file.
# 1. graph
# 2. hornet-t
# 3. gunrock-t
# 4. stac-t
