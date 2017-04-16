# Copyright (C) 2015-2017 Yoann Le Garff, Nicolas Boquet and Yann Le Bras
# navel-definition-dispatcher is licensed under the Apache License, Version 2.0

#-> BEGIN

#-> initialization

package Navel::Definition::Dispatcher::Parser 0.1;

use Navel::Base;

use parent 'Navel::Base::Definition::Parser';

#-> methods

sub new {
    shift->SUPER::new(
        definition_class => 'Navel::Definition::Dispatcher',
        do_not_need_at_least_one => 1,
        @_
    );
}

# sub AUTOLOAD {}

# sub DESTROY {}

1;

#-> END

__END__

=pod

=encoding utf8

=head1 NAME

Navel::Definition::Dispatcher::Parser

=head1 COPYRIGHT

Copyright (C) 2015-2017 Yoann Le Garff, Nicolas Boquet and Yann Le Bras

=head1 LICENSE

navel-definition-dispatcher is licensed under the Apache License, Version 2.0

=cut
