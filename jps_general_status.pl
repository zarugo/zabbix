#perl script to fetch from the database the status of the peripherals

for (`psql.exe -U jbl -d jbl -t -c "select (select count(*) from jps_peripheral_status jps,
jps_authenticated_device jap
where jps.peripheral_id = jap.peripheral_id
and jps.status = 'Offline') as offline, count(*) as total
from jps_peripheral_status jps,
jps_authenticated_device jap
where jps.peripheral_id = jap.peripheral_id" | sed 's/|//g'| head --lines=-1`)
{
($offlinejps, $totaljps) = m/(\S+)\s+(\S+)/;
print "\t{\n";
print "\t\t\"offline\":\"$offlinejps\",\n";
print "\t\t\"total\":\"$totaljps\"\n";
print "\t}\n";
}
