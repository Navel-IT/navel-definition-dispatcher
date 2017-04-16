# Copyright (C) 2015-2017 Yoann Le Garff, Nicolas Boquet and Yann Le Bras
# navel-definition-dispatcher is licensed under the Apache License, Version 2.0

#-> BEGIN

#-> initialization

package Navel::Definition::Dispatcher 0.1;

use Navel::Base;

use parent 'Navel::Base::Definition';

use JSON::Validator::OpenAPI;

use Navel::API::OpenAPI::DispatcherManager;

#-> methods

sub json_validator {
    my $class = shift;

    state $json_validator = JSON::Validator->new->schema(
        Navel::API::OpenAPI::DispatcherManager->new->schema->get('/definitions/dispatcher')
    );
}

BEGIN {
    __PACKAGE__->_create_setters(@{__PACKAGE__->json_validator->schema->get('/allOf/1/required')});
}

sub validate {
    my $class = shift;

    $class->SUPER::validate(
        raw_definition => shift,
        validator => sub {
            [
                $class->json_validator->validate(shift)
            ];
        },
        if_possible_suffix_errors_with_key_value => 'name'
    );
}

sub full_name {
    my $self = shift;

    __PACKAGE__ . '.' . $self->{name};
}

# sub AUTOLOAD {}

# sub DESTROY {}

1;

#-> END

__END__

=pod

=encoding utf8

=head1 NAME

Navel::Definition::Dispatcher

=head1 COPYRIGHT

Copyright (C) 2015-2017 Yoann Le Garff, Nicolas Boquet and Yann Le Bras

=head1 LICENSE

navel-definition-dispatcher is licensed under the Apache License, Version 2.0

=cut
