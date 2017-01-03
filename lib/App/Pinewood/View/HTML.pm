package App::Pinewood::View::HTML;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

__PACKAGE__->config(
    INCLUDE_PATH => [
        App::Pinewood->path_to( 'root', 'src' ),
        App::Pinewood->path_to( 'root', 'lib' )
    ],
    PRE_PROCESS        => 'config/main',
    WRAPPER            => 'site/wrapper',
    ERROR              => 'error.tt2',
    TEMPLATE_EXTENSION => '.tt2',
    render_die => 1,
);

=head1 NAME

App::Pinewood::View::HTML - TT View for App::Pinewood

=head1 DESCRIPTION

TT View for App::Pinewood.

=head1 SEE ALSO

L<App::Pinewood>

=head1 AUTHOR

root

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
