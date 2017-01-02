# Copyright (C) 2015-2017 Yoann Le Garff, Nicolas Boquet and Yann Le Bras
# navel-definition-storekeeper is licensed under the Apache License, Version 2.0

#-> BEGIN

#-> initialization

use strict;
use warnings;

use Test::More tests => 2;
use Test::Exception;

BEGIN {
    use_ok('Navel::Definition::Storekeeper::Parser');
}

#-> main

my $storekeepers_definitions_path = 't/01-storekeepers.json';

lives_ok {
    Navel::Definition::Storekeeper::Parser->new->read(
        file_path => $storekeepers_definitions_path
    )->make;
} 'making configuration from ' . $storekeepers_definitions_path;

#-> END

__END__
