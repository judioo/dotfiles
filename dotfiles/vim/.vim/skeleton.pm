:insert
package FOO;

use Moose;
use namespace::autoclean;

__PACKAGE__->meta->make_immutable;
1;
.
