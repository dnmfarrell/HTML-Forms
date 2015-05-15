package HTML::Forms::Input::Text;

use Moose;
use Types::Standard qw(-types);

extends 'HTML::Forms::Input';

has size => (
    is       => 'ro',
    isa      => Maybe[Int],
    required => 0,
);

around get_attributes => sub {
    my $orig   = shift;
    my $self   = shift;
    my $result = $self->$orig(@_);

    return {
        %$result,
        type => 'text',
        ($self->size ? (size => $self->size) : ()),
    };
};

__PACKAGE__->meta->make_immutable;
no Moose;
1;
