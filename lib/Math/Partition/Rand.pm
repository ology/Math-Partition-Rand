package Math::Partition::Rand;

# ABSTRACT: Partition a number into addition sequences

our $VERSION = '0.02';

use strict;
use warnings;

=head1 NAME

Math::Partition::Rand - Partition a number into addition sequences

=head1 SYNOPSIS

  use Math::Partition::Rand;
  my $partition = Math::Partition::Rand->new( top => 1, n => 3 );
  my $distribution = $partition->choose();
  # [ 0.228102577310889, 0.0880906485615138, 0.683806774127597 ]

=head1 DESCRIPTION

A C<Math::Partition::Rand> object does one thing: it partitions a number (B<top>) into a given number of
"random addition sequences" (B<n>).

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

  @vector = $self->choose;
  # [ 0.3161932258724, 0.683806774127597 ] for instance

Partition the given number B<top> into addition B<n> sequences.

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
