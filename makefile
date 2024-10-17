download-index:
	wget https://wdc.kugi.kyoto-u.ac.jp/dst_final/index.html -O index.html

download-years:
	parallel bash download.sh ::: {1957..2020}

process:
	bash 2-process.sh > dst.txt

biggest:
	grep -r -- "-4[0-9][0-9]" downloads

plot:
	cat dst.txt | gnuplot -p -e "plot '<cat'"

