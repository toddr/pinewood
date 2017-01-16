package App::Pinewood;
use Moose;
use namespace::autoclean;

use Catalyst::Runtime 5.80;

use Log::Log4perl::Catalyst;

# Set flags and add plugins for the application.
#
# Note that ORDERING IS IMPORTANT here as plugins are initialized in order,
# therefore you almost certainly want to keep ConfigLoader at the head of the
# list if you're using it.
#
#         -Debug: activates the debug mode for very useful log messages
#   ConfigLoader: will load the configuration from a Config::General file in the
#                 application's home directory
# Static::Simple: will serve static files from the application's root
#                 directory

use Catalyst qw/
  ConfigLoader
  Static::Simple
  Cache::FastMmap
  Redirect
  StackTrace
  Authentication
  Session
  Session::Store::FastMmap
  Session::State::Cookie
  Browser
  UploadProgress
  /;


extends 'Catalyst';

our $VERSION = '0.01';

# Configure the application.
#
# Note that settings in app_pinewood.conf (or other external
# configuration file that you set up manually) take precedence
# over this when using ConfigLoader. Thus configuration
# details given here can function as a default configuration,
# with an external configuration file acting as an override for
# local deployment.

__PACKAGE__->config(
    name => 'App::Pinewood',
    # Disable deprecated behavior needed by old applications
    disable_component_resolution_regex_fallback => 1,
    enable_catalyst_header => 1, # Send X-Catalyst header
    default_view  => 'HTML',
    default_model => 'pinewood',
);

__PACKAGE__->config(
    'Plugin::Static::Simple' => {
        'dirs'         => [ 'images', 'fonts', 'css', 'js', ],
        'include_path' => [ __PACKAGE__->path_to( 'root', 'static' ), ],
    }
);

__PACKAGE__->config->{hashedcookies} = {
    key       => 'dsgvhwbeb4udsl4ie4nds',
    algorithm => 'SHA1',                 # optional
    required  => 1,                      # optional
};

my $log4perl_config = "$FindBin::Bin/../etc/log4perl.cfg";
__PACKAGE__->log( Log::Log4perl::Catalyst->new( $log4perl_config, watch_delay => 10 ) );

my $id = `whoami`;
chomp $id;
__PACKAGE__->config->{cache}{backend} = {
    class      => "Cache::FastMmap",
    share_file => "/tmp/cat_fm.$id.$$",
    cache_size => "5m",
};

__PACKAGE__->config->{cache}{expires} = 43200;
__PACKAGE__->config->{cache}{backends}{jemplate}{store} = 'FastMmap';
__PACKAGE__->config->{'View::Jemplate'}{jemplate_dir} =
  __PACKAGE__->path_to( 'root', 'jemplate' );
__PACKAGE__->config->{'View::Jemplate'}{jemplate_ext} = '.tt2';

# Authentication Setup
__PACKAGE__->config(
    'Plugin::Authentication' => {
        default_realm => 'users',
        users         => {
            credential => {
                class => 'Salted',
                password_field => 'password',
                password_type  => 'clear'
            },
            store => {
                class         => 'DBIx::Class',
                user_model    => 'Pinewood::Auth',
                #role_relation => 'role',
                #role_field    => 'user_role',
            }
        }
    }
);


__PACKAGE__->setup();

=encoding utf8

=head1 NAME

App::Pinewood - Catalyst based application

=head1 SYNOPSIS

    script/app_pinewood_server.pl

=head1 DESCRIPTION

[enter your description here]

=head1 SEE ALSO

L<App::Pinewood::Controller::Root>, L<Catalyst>

=head1 AUTHOR

root

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
