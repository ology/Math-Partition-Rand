package Math::Partition::Rand;

# ABSTRACT: Partition a number into addition sequences

our $VERSION = '0.01';

use strict;
use warnings;

=head1 NAME

Math::Partition::Rand - Partition a number into addition sequences

=head1 SYNOPSIS

  use Math::Partition::Rand;
  my $p = Math::Partition::Rand->new( top => 1, n => 3 );
  my @d = $p->choose();

=head1 DESCRIPTION

A C<Math::Partition::Rand> partitions a number (B<top>) into a given number of addition sequences (B<n>).

=cut

=head1 METHODS

=head2 new()

  $x = Math::Partition::Rand->new(%arguments);

Create a new C<Math::Partition::Rand> object.

Arguments and defaults:

  top => 1,
  n   => 2,

=cut

sub new {
    my $class = shift;
    my %args = @_;
    my $self = {
        top => $args{top} || 1,
        n   => $args{n}   || 2,
    };
    bless $self, $class;
    return $self;
}

=head2 choose()

  my @array = $self->choose();

Partition the given number, B<top> into addition B<n> parts.

Example: For top = 1, n = 3

  [ 0.228102577310889,
    0.0880906485615138,
    0.683806774127597 ]

=cut

sub choose {
    my $self = shift;

    my @distribution;

    my $label = 0;
    my $top   = $self->{top};
    my $n     = $self->{n};

    for my $i ( 1 .. $n ) {
        my $curr = rand($top);
        my $next = abs( $top - $curr );

        push @distribution, $i == $n ? $top : $next;

        $top = $curr;
        $label++;
    }

    return @distribution;
}

1;
