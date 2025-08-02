use 5.020;
use strict;
use warnings;
no warnings 'experimental::smartmatch';
use feature 'say';

package Bob;

our $VERSION = '1.000';

use Exporter 5.57 qw(import);

our @EXPORT_OK = qw(hey);

sub hey {
    my $str = shift;
    my $retval;
    given ($str) {
        $retval = "Fine. Be that way!" when /\A\s*\z/;
        $retval = "Whoa, chill out!"   when /^[^a-z]*\K[A-Z]{2,}(?!.*[a-z])/;
        $retval = "Sure."              when /\?\s*\z/;
        default { $retval = "Whatever." }
    }
    return $retval;
}

1;