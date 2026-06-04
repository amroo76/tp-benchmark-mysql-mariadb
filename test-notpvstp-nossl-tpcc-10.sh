export BMK_HOME=/home/amrendra/sw/BMK-kit/BMK
cd $BMK_HOME
source $BMK_HOME/.bench
logdir="/home/amrendra/projects/TP/log/tpcc"
mkdir -p $logdir

cd  /home/amrendra/TAF
#mysql
BIN_DIR=/home/amrendra/TAF/database_software_installs/mysql-9.7.0-linux-glibc2.28-x86_64/bin
perl ./taf.pl --prop=/home/amrendra/projects/TP/sysbench_lua_mysql.properties --action=init-start-db-exit   --verbose --skip-client-builds --db-software-install-dir=/home/amrendra/TAF/database_software_installs/mysql-9.7.0-linux-glibc2.28-x86_64 --ignore-running-db-process  --db-config-file=/home/amrendra/projects/TP/mysql_simple_2gbp.cnf --ignore-running-db-process
sleep 2
$BIN_DIR/mysql -u root --password=MariadbPass_@123 --socket=/home/amrendra/TAF/tmp/db.sock -e " create database test; create user 'dim'@'%' identified by '.userMDS00';grant SELECT,INSERT,DELETE,UPDATE,CREATE,DROP,PROCESS,USAGE,INDEX,SHOW DATABASES on *.* to 'dim'@'%' ;"
sleep 2
$BIN_DIR/mysql --host=localhost -udim --get-server-public-key  --socket=/home/amrendra/TAF/tmp/db.sock -p.userMDS00 -vvv -e "select 1; "
sleep 10
cd $BMK_HOME/sb_exec/lua

$BMK_HOME/sysbench-1.1-mysql80-ssl111L-x64 $BMK_HOME/sb_exec/lua/tpcc.lua   --db-driver=mysql --mysql-host=localhost --events=0 --time=300 --mysql-db=test --mysql-password=.userMDS00 --mysql-socket=/home/amrendra/TAF/tmp/db.sock --mysql-user=dim --threads=10  --scale=10 --tables=1 --use_fk=0 --mysql-ssl=disabled  create

$BMK_HOME/sysbench-1.1-mysql80-ssl111L-x64 $BMK_HOME/sb_exec/lua/tpcc.lua   --db-driver=mysql --mysql-host=localhost --events=0 --time=300 --mysql-db=test --mysql-password=.userMDS00 --mysql-socket=/home/amrendra/TAF/tmp/db.sock --mysql-user=dim --threads=10  --scale=10 --tables=1 --use_fk=0 --mysql-ssl=disabled  prepare
dt=`date +%Y%m%d%H%M%S`
echo "tpcc10 notp nossl mysql" >>/var/tmp/log
for users in 4 8 16 32 64 128
do

    $BMK_HOME/sysbench-1.1-mysql80-ssl111L-x64 $BMK_HOME/sb_exec/lua/tpcc.lua   --db-driver=mysql --mysql-host=localhost --events=0 --time=300 --mysql-db=test --mysql-password=.userMDS00 --mysql-socket=/home/amrendra/TAF/tmp/db.sock --mysql-user=dim --threads=${users}  --scale=10 --tables=1 --use_fk=0 --mysql-ssl=disabled --report-interval=2 run >> ${logdir}/mysql_notp_tpcc10_${dt}.log
sleep 15
done

$BIN_DIR/mysql --host=localhost -uroot --get-server-public-key  --socket=/home/amrendra/TAF/tmp/db.sock -p.userMDS00 -vvv -e "shutdown;"

sleep 15


cd  /home/amrendra/TAF
#no tp mariadb

BIN_DIR=/home/amrendra/TAF/database_software_installs/mariadb-13.0.1-linux-systemd-x86_64/bin

perl ./taf.pl --prop=/home/amrendra/projects/TP/sysbench_lua.properties --action=init-start-db-exit  --exec-sql-file-after-test-setup=/extra/TAF/scripts/sql/mariadb/status/global_variables_dump.sql --verbose --skip-client-builds --db-software-install-dir=/home/amrendra/TAF/database_software_installs/mariadb-13.0.1-linux-systemd-x86_64 --ignore-running-db-process

sleep 2

cd $BMK_HOME/sb_exec/lua

$BMK_HOME/sysbench-1.1-mysql80-ssl111L-x64 $BMK_HOME/sb_exec/lua/tpcc.lua   --db-driver=mysql --mysql-host=localhost --events=0 --time=300 --mysql-db=test --mysql-password=MariadbPass_@123 --mysql-socket=/home/amrendra/TAF/tmp/db.sock --mysql-user=mariadb_tester --threads=10  --scale=10 --tables=1 --use_fk=0 --mysql-ssl=disabled  create

$BMK_HOME/sysbench-1.1-mysql80-ssl111L-x64 $BMK_HOME/sb_exec/lua/tpcc.lua   --db-driver=mysql --mysql-host=localhost --events=0 --time=300 --mysql-db=test --mysql-password=MariadbPass_@123 --mysql-socket=/home/amrendra/TAF/tmp/db.sock --mysql-user=mariadb_tester --threads=10  --scale=10 --tables=1 --use_fk=0 --mysql-ssl=disabled  prepare
dt=`date +%Y%m%d%H%M%S`
echo "tpcc10 notp nossl mariadb" >>/var/tmp/log
for users in 4 8 16 32 64 128
do

    $BMK_HOME/sysbench-1.1-mysql80-ssl111L-x64 $BMK_HOME/sb_exec/lua/tpcc.lua   --db-driver=mysql --mysql-host=localhost --events=0 --time=300 --mysql-db=test --mysql-password=MariadbPass_@123 --mysql-socket=/home/amrendra/TAF/tmp/db.sock --mysql-user=mariadb_tester --threads=${users}  --scale=10 --tables=1 --use_fk=0 --mysql-ssl=disabled --report-interval=2 run >> ${logdir}/mariadb_notp_tpcc10_${dt}.log
sleep 15
done

$BIN_DIR/mariadb --host=localhost -uroot   --socket=/home/amrendra/TAF/tmp/db.sock --password=MariadbPass_@123 -vvv -e "shutdown;"

sleep 15

#tp mariadb
cd  /home/amrendra/TAF

BIN_DIR=/home/amrendra/TAF/database_software_installs/mariadb-13.0.1-linux-systemd-x86_64/bin
perl ./taf.pl --prop=/home/amrendra/projects/TP/sysbench_lua.properties --action=init-start-db-exit  --exec-sql-file-after-test-setup=/extra/TAF/scripts/sql/mariadb/status/global_variables_dump.sql --verbose --skip-client-builds --db-software-install-dir=/home/amrendra/TAF/database_software_installs/mariadb-13.0.1-linux-systemd-x86_64 --db-config-file=/home/amrendra/projects/TP/mariadb_simple_2gbp_tp.cnf --ignore-running-db-process

sleep 2

cd $BMK_HOME/sb_exec/lua

$BMK_HOME/sysbench-1.1-mysql80-ssl111L-x64 $BMK_HOME/sb_exec/lua/tpcc.lua   --db-driver=mysql --mysql-host=localhost --events=0 --time=300 --mysql-db=test --mysql-password=MariadbPass_@123 --mysql-socket=/home/amrendra/TAF/tmp/db.sock --mysql-user=mariadb_tester --threads=10  --scale=10 --tables=1 --use_fk=0 --mysql-ssl=disabled  create

$BMK_HOME/sysbench-1.1-mysql80-ssl111L-x64 $BMK_HOME/sb_exec/lua/tpcc.lua   --db-driver=mysql --mysql-host=localhost --events=0 --time=300 --mysql-db=test --mysql-password=MariadbPass_@123 --mysql-socket=/home/amrendra/TAF/tmp/db.sock --mysql-user=mariadb_tester --threads=10  --scale=10 --tables=1 --use_fk=0 --mysql-ssl=disabled  prepare
dt=`date +%Y%m%d%H%M%S`
echo "tpcc10 tp nossl mariadb" >>/var/tmp/log
for users in 4 8 16 32 64 128
do

    $BMK_HOME/sysbench-1.1-mysql80-ssl111L-x64 $BMK_HOME/sb_exec/lua/tpcc.lua   --db-driver=mysql --mysql-host=localhost --events=0 --time=300 --mysql-db=test --mysql-password=MariadbPass_@123 --mysql-socket=/home/amrendra/TAF/tmp/db.sock --mysql-user=mariadb_tester --threads=${users}  --scale=10 --tables=1 --use_fk=0 --mysql-ssl=disabled --report-interval=2 run >> ${logdir}/mariadb_tp_tpcc10_${dt}.log
sleep 15
done
$BIN_DIR/mariadb --host=localhost -uroot   --socket=/home/amrendra/TAF/tmp/db.sock --password=MariadbPass_@123 -vvv -e "shutdown;"

