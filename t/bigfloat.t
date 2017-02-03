# -*- CPerl -*-

use Test::More qw(no_plan);
use strict;
use warnings;

use POSIX;
setlocale(&LC_ALL, 'C');

BEGIN { use_ok('Number::Format', ':subs') }

SKIP:
{
    eval "use Math::BigFloat";
    skip "No Math::BigFloat installed" if $@;

    is(round(Math::BigFloat->new(123.456), 2), '123.46', "round as sub");

    my $nf = Number::Format->new();
    is($nf->round(Math::BigFloat->new(123.456), 2), '123.46', "round");
    is($nf->format_number(Math::BigFloat->new(500.27), 2, 1), '500.27');
    is($nf->format_number(Math::BigFloat->bpi(100), 7, 1), '3.1415927');
    is($nf->format_price(Math::BigFloat->bpi(100), 4, "\$"), '$ 3.1416');
    is($nf->format_price(Math::BigFloat->bpi(100), 60, "\$"),
       '$ 3.141592653589793238462643383279502884197169399375105820974945');
}
