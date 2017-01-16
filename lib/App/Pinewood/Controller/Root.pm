package App::Pinewood::Controller::Root;

use strict;
use warnings;

use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

use Log::Log4perl qw(:easy);

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=encoding utf-8

=head1 NAME

App::Pinewood::Controller::Root - Root Controller for App::Pinewood

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 index

The root page (/)

=cut

sub index : Path : Args(0) {
    my ( $self, $c ) = @_;

    #$c->res->redirect( $c->uri_for('/') );
}

sub default : Path {
    my ( $self, $c ) = @_;
    $c->response->body('Page not found');
    $c->response->status(404);
}

# These paths should not be required to be authorized.
my @dont_authorize_paths = qw{login logout};

sub auto : Private {
    my $self = shift;
    my ( $c, $controller, $page ) = @_;

    my $path = $c->action;
    $path =~ s{/?index$}{};    # convert index subs into the / path.
    $c->stash->{'current_path'} = "/$path";

    return $c if ( grep { $_ eq $path } @dont_authorize_paths );

    unless ( $c->user_exists() ) {
        if ( $path eq 'login' && $c->req->params->{'path'} ) {
            $path = $c->req->params->{'path'}
        }
        DEBUG("NO USER???");
        $c->res->redirect( $c->uri_for('/login') . '?path=' . $path );
        return 0;
    }

    # Go straight to login page
    my $username = $c->stash->{'logged_in_user'} = $c->user->email;

    # Success on a controlled path. Document if access was given because of root access.
    return $c;
}

## Always called to make sure everything is setup. return the current user if we can determine it.
#sub validate_cookie : Private {
#    my $self     = shift;
#    my $c        = shift;
#    my $request  = $c->request->cookies;
#    my $response = $c->response->cookies;
#
#    # Pull the username if the cookie has a good value;
#    my $user_name =
#      ( $request->{'pinewood'} && $request->{'pinewood'}->value )
#      ? $request->{'pinewood'}->value
#      : undef;
#    if ($user_name) {
#        $user_name = $user_name->[0] if ( ref $user_name eq 'ARRAY' );
#        return $user_name;
#    }
#
#    return;
#}

sub login : Local {
    my ( $self, $c ) = @_;

    $c->stash->{'path'} = $c->req->params->{'path'} || '/';

    my $user_name = $c->req->params->{'username'};
    my $password  = $c->req->params->{'password'};
    return unless ( $user_name && $password );

    $c->authenticate( { 'username' => $user_name, 'password' => $password } );

    if ( $c->user ) {
        DEBUG( "Redirecting to: " . $c->stash->{'path'} );
        $c->res->redirect( $c->uri_for( $c->stash->{'path'} ) );
    }
    else {
        $c->stash->{'login_failure'} = "user and/or password entered was invalid!";
        $c->stash->{'username'}      = $user_name;
        $c->stash->{'path'}          = $c->stash->{'path'};
    }

    return $c;

}

sub logout : Local {
    my ( $self, $c ) = @_;

    $c->logout();
    $c->res->redirect( $c->req->headers->referer || $c->uri_for('/login') );
    return $c;
}

sub unauthorized : Local {
    my ( $self, $c, $reason ) = @_;

    # Store this so end knows if we blocked access.
    $c->stash->{'unauthorized_reason'} = $reason || '';
    $c->stash->{template} = 'unauthorized.tt2';

    return $c;
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {
    my ( $self, $c ) = @_;

    # Determine if access was denied
    my $authorized = defined $c->stash->{'unauthorized_reason'} ? 0 : 1;

    # Username
    #my $user = $c->user ? $c->user->username : 'not logged in';

    ## Log the event.
    #$c->model->log_access(
    #    $user, $c->stash->{'current_path'}, $authorized,
    #    $c->stash->{'unauthorized_reason'}
    #    ? ( $c->stash->{'unauthorized_reason'} )
    #    : ()
    #);
}

=head1 AUTHOR

Todd Rinaldo

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
