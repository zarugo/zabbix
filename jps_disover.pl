$first = 1;
print "[\n";
for (`psql.exe -U jbl -d jbl -t -c "select distinct(pa.peripheral_id), pa.ip, pa.type from jps_peripheral_status ps join jps_authenticated_device pa on ps.peripheral_id = pa.peripheral_id " | sed 's/|//g'| head --lines=-1`)
{
	($jpsuid, $jpsip , $jpstype) = m/(\S+)\s+(\S+)\s+(\S+)/;
	print "\t,\n" if not $first;
	$first = 0;
	print "\t{\n";
	print "\t\t\"{#JPSUID}\":\"$jpsuid\",\n";
	print "\t\t\"{#JPSIP}\":\"$jpsip\",\n";
  print "\t\t\"{#JPSTYPE}\":\"$jpstype\"\n";
	print "\t}\n";
}
