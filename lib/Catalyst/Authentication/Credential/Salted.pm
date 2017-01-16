package Catalyst::Authentication::Credential::Salted;

use Moose;

use Catalyst::Exception;
use Log::Log4perl qw(:easy);

use Crypt::Passwd::XS;

sub authenticate {
    my ( $self, $c, $realm, $authinfo ) = @_;

    my $username = $authinfo->{'username'} or return;
    my $password = $authinfo->{'password'} or return;

    my $userfindauthinfo = { 'email' => $username };

    my $user_obj = $realm->find_user( $userfindauthinfo, $c );

    # deal with no-such-user in store
    unless ( ref($user_obj) and $user_obj->password) {
        DEBUG("Unable to locate user matching user info provided ($username)");
        return;
    }

    my $salted_pass = $user_obj->password;
    $salted_pass =~ s/\s+$//;
    
    my $validate = Crypt::Passwd::XS::crypt($password, $salted_pass);
    if ($salted_pass eq $validate) {
        DEBUG("Password for $username matches!");
        return $user_obj;
    }

    return;
}

1;