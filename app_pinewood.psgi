use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/lib";
use App::Pinewood;

my $app = App::Pinewood->apply_default_middlewares(App::Pinewood->psgi_app);
$app;

