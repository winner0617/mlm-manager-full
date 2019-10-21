package MLM::Incomeamount::Filter;

use strict;
use MLM::Filter;
use vars qw(@ISA);

@ISA=('MLM::Filter');

sub preset {
	my $self = shift;
	my $err  = $self->SUPER::preset(@_);
	return $err if $err;

	my $ARGS   = $self->{ARGS};
	my $r      = $self->{R};
	my $who    = $ARGS->{g_role};
	my $action = $ARGS->{g_action};

  if ($who eq 'a' && $action eq 'topics') {
    $ARGS->{sortby} = 'i.amount_id';
    $ARGS->{sortreverse} = 1;
  }

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

  if ($action eq 'topics' && $ARGS->{u} && $ARGS->{bonusType}) {
    $extra->{"_gsql"} = $ARGS->{u} ." LIKE '" . $ARGS->{v} . "\%' AND i.bonusType='" . $ARGS->{bonusType} . "'";
  } elsif ($action eq 'topics' && $ARGS->{u}) {
    $extra->{"_gsql"} = $ARGS->{u} ." LIKE '" . $ARGS->{v} . "\%'";
  } elsif ($action eq 'topics' && $ARGS->{bonusType}) {
    $extra->{"i.bonusType"} = $ARGS->{bonusType};
  }

	return;
}

sub after {
	my $self = shift;
	my $err  = $self->SUPER::after(@_);
	return $err if $err;

	my $ARGS   = $self->{ARGS};
	my $r      = $self->{R};
	my $who    = $ARGS->{g_role};
	my $action = $ARGS->{g_action};

    my ($form) = @_;
    my $lists = $form->{LISTS};

	return;
}

1;
