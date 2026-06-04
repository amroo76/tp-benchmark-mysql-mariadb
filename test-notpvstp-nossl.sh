cd  /home/amrendra/TAF


#echo "notp nossl mysql" >>/var/tmp/log

#perl ./taf.pl --prop=/home/amrendra/projects/TP/sysbench_lua_mysql.properties --action=init-start-db-run-tests   --verbose --skip-client-builds --db-software-install-dir=/home/amrendra/TAF/database_software_installs/mysql-9.7.0-linux-glibc2.28-x86_64 --ignore-running-db-process  --threads=4,8,16,32,64,128 --tests=point_select,oltp_ro,oltp_rw --db-config-file=/home/amrendra/projects/TP/mysql_simple_2gbp.cnf --exec-sql-file-after-test-setup=/home/amrendra/projects/TP/mysql_global_variables_dump.sql
# --exec-sql-file-after-test-setup=/home/amrendra/projects/TP/mysql_global_variables_dump.sql

#echo "notp nossl mariadb" >>/var/tmp/log
#perl ./taf.pl --prop=/home/amrendra/projects/TP/sysbench_lua.properties --action=init-start-db-run-tests  --exec-sql-file-after-test-setup=/home/amrendra/TAF/scripts/sql/mariadb/status/global_variables_dump.sql --verbose --skip-client-builds --db-software-install-dir=/home/amrendra/TAF/database_software_installs/mariadb-13.0.1-linux-systemd-x86_64 --comments="notp ps" --ignore-running-db-process --threads=4,8,16,32,64,128 --tests=point_select,oltp_ro,oltp_rw  --comments="notp nossl mariadb"

#sleep 30

#echo "tp nossl mariadb" >>/var/tmp/log
#perl ./taf.pl --prop=/home/amrendra/projects/TP/sysbench_lua.properties --action=init-start-db-run-tests  --exec-sql-file-after-test-setup=/home/amrendra/TAF/scripts/sql/mariadb/status/global_variables_dump.sql --verbose --skip-client-builds --db-software-install-dir=/home/amrendra/TAF/database_software_installs/mariadb-13.0.1-linux-systemd-x86_64 --db-config-file=/home/amrendra/projects/TP/mariadb_simple_2gbp_tp.cnf --ignore-running-db-process --threads=4,8,16,32,64,128 --tests=point_select,oltp_ro,oltp_rw --comments="tp nossl mariadb"

#tpcc
#echo "tpcc notp nossl mysql" >>/var/tmp/log
#perl ./taf.pl --prop=/home/amrendra/projects/TP/sysbench_lua_mysql_tpcc.properties --action=init-start-db-run-tests   --verbose --skip-client-builds --db-software-install-dir=/home/amrendra/TAF/database_software_installs/mysql-9.7.0-linux-glibc2.28-x86_64 --ignore-running-db-process --db-config-file=/home/amrendra/projects/TP/mysql_simple_2gbp.cnf --exec-sql-file-after-test-setup=/home/amrendra/projects/TP/mysql_global_variables_dump.sql --comments="notp tpcc mysql"
#sleep 30
#echo "tpcc notp nossl mariadb" >>/var/tmp/log
#perl ./taf.pl --prop=/home/amrendra/projects/TP/sysbench_lua_tpcc.properties --action=init-start-db-run-tests  --exec-sql-file-after-test-setup=/home/amrendra/TAF/scripts/sql/mariadb/status/global_variables_dump.sql --verbose --skip-client-builds --db-software-install-dir=/home/amrendra/TAF/database_software_installs/mariadb-13.0.1-linux-systemd-x86_64 --comments="notp tpcc mariadb" --ignore-running-db-process  --comments="notp nossl mariadb"
#sleep 30
#echo "tpcc tp nossl mariadb" >>/var/tmp/log
#perl ./taf.pl --prop=/home/amrendra/projects/TP/sysbench_lua_tpcc.properties --action=init-start-db-run-tests  --exec-sql-file-after-test-setup=/home/amrendra/TAF/scripts/sql/mariadb/status/global_variables_dump.sql --verbose --skip-client-builds --db-software-install-dir=/home/amrendra/TAF/database_software_installs/mariadb-13.0.1-linux-systemd-x86_64 --db-config-file=/home/amrendra/projects/TP/mariadb_simple_2gbp_tp.cnf --ignore-running-db-process  --comments="tp nossl tpcc mariadb"

#hammerdb
echo "hammer tpcc notp nossl mysql" >>/var/tmp/log
perl ./taf.pl --prop=/home/amrendra/projects/TP/hammerdb_tprocc_beta_mysql.properties --action=init-start-db-run-tests   --verbose --skip-client-builds --db-software-install-dir=/home/amrendra/TAF/database_software_installs/mysql-9.7.0-linux-glibc2.28-x86_64 --ignore-running-db-process --db-config-file=/home/amrendra/projects/TP/mysql_simple_2gbp.cnf --exec-sql-file-after-test-setup=/home/amrendra/projects/TP/mysql_global_variables_dump.sql --comments="notp tpcc mysql"
#sleep 30
#echo "hammer tpcc notp nossl maridb" >>/var/tmp/log
#perl ./taf.pl --prop=/home/amrendra/projects/TP/hammerdb_tprocc_beta_mariadb.properties --action=init-start-db-run-tests  --exec-sql-file-after-test-setup=/home/amrendra/TAF/scripts/sql/mariadb/status/global_variables_dump.sql --verbose --skip-client-builds --db-software-install-dir=/home/amrendra/TAF/database_software_installs/mariadb-13.0.1-linux-systemd-x86_64 --comments="notp tpcc mariadb" --ignore-running-db-process  --comments="notp nossl mariadb"
sleep 30
#echo "hammer tp nossl mariadb" >>/var/tmp/log
#perl ./taf.pl --prop=/home/amrendra/projects/TP/hammerdb_tprocc_beta_mariadb.properties --action=init-start-db-run-tests  --exec-sql-file-after-test-setup=/home/amrendra/TAF/scripts/sql/mariadb/status/global_variables_dump.sql --verbose --skip-client-builds --db-software-install-dir=/home/amrendra/TAF/database_software_installs/mariadb-13.0.1-linux-systemd-x86_64 --db-config-file=/home/amrendra/projects/TP/mariadb_simple_2gbp_tp.cnf --ignore-running-db-process  --comments="tp nossl tpcc mariadb"
