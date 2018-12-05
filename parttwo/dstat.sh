# -tlvrn flag parses all dstat output 
# run dstat for a specific period, run sed to modify data, then awk to parse to JSON
timeout 10s dstat -tlvrn --output ~/tempfile.csv

########################
# Future development
# ------------------
# current script only runs when code is built on Jenkins
# add dstat command to /etc/cron.d/dstat to run every few minutes
# dstat -tlvrn --output ~/dstat.csv 5 3 > /dev/null 
# run script to update static json file every few minutes

# takes in a file as an argument, e.g. tempfile.csv and creates a newly formatted file called dstat.csv which replaces "|" within the csv with a whitespace
sed 's/,/ /g' ~/tempfile.csv > ~/dstat.csv

# pipes output of cat of formatted dstat.csv to awk for parsing data into json format
# creates a file in json format with timestamp

sudo cat ~/dstat.csv | awk ' BEGIN { print  " [ " ; }                 \
       { print                                                 \
               "\""$1" "$2"\": \n{"                            \
               "\n\t\"Load (avg)\":\t{"                        \
                       "\n\t\t\"1m\": \""$3"\",\n"             \
                       "\t\t\"5m\": \""$4"\",\n"               \
                       "\t\t\"15m\": \""$5"\"\n\t},"           \
               "\n\t\"Procs\":\t{"                             \
                       "\n\t\t\"run\": \""$6"\",\n"            \
                       "\t\t\"blk\": \""$7"\",\n"              \
                       "\t\t\"new\": \""$8"\"\n\t},"           \
               "\n\t\"Memory Usage\":\t{"                      \
                       "\n\t\t\"used\": \""$9"\",\n"           \
                       "\t\t\"buff\": \""$10"\",\n"            \
                       "\t\t\"cach\": \""$11"\",\n"            \
                       "\t\t\"free\": \""$12"\"\n\t},"         \
               "\n\t\"Paging\":\t{"                            \
                       "\n\t\t\"in\": \""$13"\",\n"            \
                       "\t\t\"out\": \""$14"\"\n\t},"          \
               "\n\t\"Disk Total\":\t{"                        \
                       "\n\t\t\"in\": \""$15"\",\n"            \
                       "\t\t\"out\": \""$16"\"\n\t},"          \
               "\n\t\"System\": \t{"                           \
                       "\n\t\t\"int\": \""$17"\",\n"           \
                       "\t\t\"csw\": \""$18"\"\n\t},"          \
               "\n\t\"Total CPU Usage\":\t{"                   \
                       "\n\t\t\"usr\": \""$19"\",\n"           \
                       "\t\t\"sys\": \""$20"\",\n"             \
                       "\t\t\"idl\": \""$21"\",\n"             \
                       "\t\t\"wait\": \""$22"\",\n"            \
                       "\t\t\"hiq\": \""$23"\",\n"             \
                       "\t\t\"siq\": \""$24"\"\n\t},"          \
               "\n\t\"IO Total\":\t{"                          \
                       "\n\t\t\"read\": \""$25"\",\n"          \
                       "\t\t\"writ\": \""$26"\"\n\t},"         \
               "\n\t\"Net Total\":\t{"                         \
                       "\n\t\t\"recv\": \""$27"\",\n"          \
                       "\t\t\"send\": \""$28"\"\n\t}"          \
               "\n},\n"                                        \
       }                                                       \
       END { print "]" } ' > /usr/share/nginx/html/cicd/dstat_$(date +"%Y%m%d_%H%M%S").json

# deletes dstat.csv from to clean file and save disk space
rm ~/tempfile.csv
rm ~/dstat.csv
