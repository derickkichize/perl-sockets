#!/usr/bin/env perl

use strict;
use warnings;
use IO::Socket::INET;

my $port = 9000;

my $server = IO::Socket::INET->new(
    localPort => $port,
    Proto => 'tcp',
    Listen => SOMAXCONN,
    Reuse => 0
    ) or die "Error while start server: $!\n";

print "Server starts. waiting for connections...\n";
my $client_socket = $server->accept();

my $data = <$client_socket>;
print "message received from client: $data\n";

$client_socket->close();

$server->close();
