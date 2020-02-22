$first = 1;
print "[\n";
for (`psql.exe -U jbl -d jbl -t -c "select peripheral_id from jps_authenticated_device" | sed 's/|//g'| head --lines=-1`)
{
	($jpsuid) = m/(\S+)/;
	print "\t,\n" if not $first;
	$first = 0;
	print "\t{\n";
	print "\t\t\"{#JPSUID}\":\"$jpsuid\",\n";
	print "\t}\n";
}
print "]\n";

