package MLM::Packagetype::Filter;

use strict;
use MLM::Filter;
use vars qw(@ISA);

@ISA=('MLM::Filter');

sub preset {
	my $self = shift;
	my $err  = $self->SUPER::preset(@_);
	return $err if $err;

#	my $ARGS   = $self->{ARGS};
#	my $r      = $self->{R};
#	my $who    = $ARGS->{g_role};
#	my $action = $ARGS->{g_action};

	return;
}

sub before {
	my $self = shift;
	my $err  = $self->SUPER::before(@_);
	return $err if $err;

	my ($form, $extra, $nextextras) = @_;

	my $ARGS   = $self->{ARGS};
	my $r      = $self->{R};
	my $who    = $ARGS->{g_role};
	my $action = $ARGS->{g_action};

	if ($action eq 'topics') {
		$extra->{_gsql} = "typeid!=0";
	}

	return;
}

sub after {
	my $self = shift;
	my $err  = $self->SUPER::after(@_);
	return $err if $err;

#	my $ARGS   = $self->{ARGS};
#	my $r      = $self->{R};
#	my $who    = $ARGS->{g_role};
#	my $action = $ARGS->{g_action};

#	my ($form) = @_;
#	my $lists = $form->{LISTS};

	return;
}

1;
