# -*- CPerl -*-

use Test::More qw(no_plan);
use strict;

use POSIX;
setlocale(&LC_ALL, 'C');

BEGIN { use_ok('Number::Format') }

sub Number::Format::localeconv {
    return {
        p_sign_posn => -1,
        n_sign_posn => 42,
        decimal_point => ',',
        # no thousands_sep
    };
}

my $fmt = Number::Format->new;

is($fmt->{n_sign_posn}, 42, 'mocked locale in use');
isnt($fmt->{p_sign_posn}, -1, '-1 fixed');

is($fmt->{thousands_sep}, "", 'empty default thousand_sep on comma for decimal_point');
