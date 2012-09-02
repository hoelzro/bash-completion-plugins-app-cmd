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

# ABSTRACT: A Bash::Completion plugin for writing App::Cmd plugins

=head1 SYNOPSIS

  use parent 'Bash::Completion::Plugins::App::Cmd';

  # fill in everything you normally would for Bash::Completion,
  # except for complete

  sub command_class { 'My::Cmd' } # mandatory

=head1 DESCRIPTION

This is a L<Bash::Completion> plugin that assists in writing other
L<Bash::Completion> plugins for programs that use L<App::Cmd>.  Everything
is done similar to writing a normal L<Bash::Completion> plugin, except you
need to define the L</command_class> method rather than the
L<'Bash::Completion::Plugin'/complete> method.  L</command_class> is
the name of the class that you use C<use App::Cmd::Setup -app> from.

=head1 METHODS

=head2 complete

Populates the L<Bash::Completion> request with commands from the
given L<App::Cmd> class.

=head2 command_class

Returns the name of the class that this plugin will extract command
names from.  This method must be implemented by subclasses.

=head1 SEE ALSO

L<App::Cmd>, L<Bash::Completion>

=cut
