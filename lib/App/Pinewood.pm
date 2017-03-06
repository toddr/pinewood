package App::Pinewood;
use Dancer2;
use Dancer2::Plugin::DBIC;

our $VERSION = '0.1';

get '/' => sub {
     my $user = schema('default')->resultset('User')->find({id => 1});

     template 'index', {user => $user->name};
};

true;
