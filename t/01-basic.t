use strict;
use warnings;
use lib 't/lib';

use Bash::Completion::Plugin::Test;
use Test::More tests => 4;

my $tester = Bash::Completion::Plugin::Test->new(
    plugin => 'Bash::Completion::Plugins::TestCommand',
);

$tester->check_completions('test-command ^', [qw/init foo bar baz --help -h -? commands help/]);
$tester->check_completions('test-command i^', [qw/init/]);
$tester->check_completions('test-command b^', [qw/bar baz/]);
$tester->check_completions('test-command -^', [qw/--help -h -?/]);
