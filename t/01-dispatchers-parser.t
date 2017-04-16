# Copyright (C) 2015-2017 Yoann Le Garff, Nicolas Boquet and Yann Le Bras
# navel-definition-dispatcher is licensed under the Apache License, Version 2.0

#-> BEGIN

#-> initialization

use strict;
use warnings;

use Test::More tests => 2;
use Test::Exception;

BEGIN {
    use_ok('Navel::Definition::Dispatcher::Parser');
}

#-> main

my $dispatchers_definitions_path = 't/01-dispatchers.json';

lives_ok {
    Navel::Definition::Dispatcher::Parser->new->read(
        file_path => $dispatchers_definitions_path
    )->make;
} 'making configuration from ' . $dispatchers_definitions_path;

#-> END

__END__
