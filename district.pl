use strict;
use warnings;
use utf8;
use Encode;

binmode STDOUT, "encoding(utf8)";

my %date_district_num = ();
my %districts = ();

my $line = <STDIN>;
while (my $line = <STDIN>) {
    chomp $line;
    $line = decode_utf8($line);
    my ($date, $district, $age, $sex) = split /,/, $line;
    $district =~ s/神奈川県//;
    $date_district_num{$date}->{$district} += 1;
    $districts{$district} += 1;
    #print "$date $district $age $sex\n";
}

my @districts_sorted = sort {$districts{$b} <=> $districts{$a}} keys(%districts);

print "Date";
for my $dist (@districts_sorted) {
    print ",$dist";
}
print "\n";

for my $date (sort(keys(%date_district_num))) {
    print "$date";
    for my $d (@districts_sorted) {
	my $num = $date_district_num{$date}->{$d};
	if (!defined $num) { $num = 0; }
	print ",$num";
    }
    print "\n";
}

