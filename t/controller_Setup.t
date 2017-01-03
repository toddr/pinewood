use strict;
use warnings;
use Test::More;


use Catalyst::Test 'App::Pinewood';
use App::Pinewood::Controller::Setup;

ok( request('/setup')->is_success, 'Request should succeed' );
done_testing();
