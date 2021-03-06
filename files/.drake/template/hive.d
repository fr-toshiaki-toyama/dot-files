HIVE_EXEC:=/usr/bin/hive

file() [eval]
  echo "$CODE" | tee $OUTPUT | nl

hive()
  $[HIVE_EXEC] -f $INPUT > $OUTPUT

phive()
  ls $INPUTS | tee $OUTPUT | parallel --gnu --line-buffer --tagstring "[ {} ]" --results parallel.stdout.logs --eta --progress --joblog parallel.job.log -j 4 --halt 1 --load
 100% --noswap "cat -n {}; $[HIVE_EXEC] -f {} > {}.o"

xhive()
  ls $INPUTS | tee $OUTPUT | xargs -I {} -P4 bash -c 'echo {}; cat -n {}; $[HIVE_EXEC] -f {} > {}.o'

diff()
  diff $INPUTS | tee $OUTPUT

%include ./hql.drake

; Contents of hql.drake:
;
;select_tbl.hql <- [method:file method-mode:append]
;  SELECT * FROM tbl1
;
;select_tbl.2.hql <- [method:file method-mode:append]
;  SELECT * FROM tbl2
;

select_tbl.hql.o <- select_tbl.hql [method:hive]

select_tbl.2.hql.o <- select_tbl.2.hql [method:hive]

ph <- select_tbl.hql, select_tbl.2.hql [method:phive]

xh <- select_tbl.hql, select_tbl.2.hql [method:xhive]

