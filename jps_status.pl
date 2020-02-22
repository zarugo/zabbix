$jpsip = $ENV{'JPS'};

for (`psql.exe -U jbl -d jbl -t -c "select distinct(pa.peripheral_id), pa.ip, ps.status, pa.type from jps_peripheral_status ps join jps_authenticated_device pa on ps.peripheral_id = pa.peripheral_id where pa.peripheral_id = \'$jpsip\' " | sed 's/|//g'| head --lines=-1`)
{	
	($jpsuid, $jpsip , $jpsstatus, $jpstype ) = m/(\S+)\s+(\S+)\s+(\S+)\s+(\S+)/;	

  print "\t{\n";	print "\t\t\"uid\":\"$jpsuid\",\n";	
	print "\t\t\"ip\":\"$jpsip\",\n";	
	print "\t\t\"status\":\"$jpsstatus\",\n";    
	print "\t\t\"type\":\"$jpstype\"\n";	
	print "\t}\n";

}
