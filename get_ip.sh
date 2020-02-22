#!/bin/bash
ip=$(ipconfig | grep IPv4 | tail -n1 | awk '{print $14}')
echo $ip