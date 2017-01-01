use strict;
use warnings;

use App::Pinewood;

my $app = App::Pinewood->apply_default_middlewares(App::Pinewood->psgi_app);
$app;

