#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;

use_ok 'Math::Partition::Rand';

my $obj = Math::Partition::Rand->new(
    top => 1,
    n   => 3,
);
isa_ok $obj, 'Math::Partition::Rand';

my @x = $obj->choose();

is scalar(@x), 3, 'partition';

my $x = 0;
$x = $x + $_ for @x;
is $x, 1, 'sum to 1';

done_testing();
