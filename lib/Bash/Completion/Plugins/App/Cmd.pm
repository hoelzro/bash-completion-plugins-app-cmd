## no critic (RequireUseStrict)
package Bash::Completion::Plugins::App::Cmd;

## use critic (RequireUseStrict)
use strict;
use warnings;
use parent 'Bash::Completion::Plugin';

use Bash::Completion::Utils qw(prefix_match);
use Class::Load qw(load_class);

sub complete {
    my ( $self, $r ) = @_;

    my $class = $self->command_class;
    load_class($class);

    my @names = $class->command_names;

    $r->candidates(prefix_match($r->word, @names));
}

1;

__END__

# ABSTRACT: A short description of Bash::Completion::Plugins::App::Cmd

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 FUNCTIONS

=head1 SEE ALSO

=cut
