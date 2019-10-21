#!/usr/bin/perl

use lib qw(/SAMPLE_home/mlm/lib /SAMPLE_home/perl);
use strict;
use JSON;
use MLM::Beacon;
use Test::More tests=>14;

my $admin = MLM::Beacon->new(role=>"a");
my $err = $admin->get_credential("gmarket","gmarketIsCool");
die $err if $err;

my @all = (
	["category", [ "action"=>"insert", "categoryid"=>1, "title"=>"Test Cat One", "description"=>"Category for test, description number one."]],
	["gallery", [ "action"=>"insert", "categoryid"=>1, "title"=>"Test item One", "description"=>"Product item for test, description number one.", "price"=>200, "bv"=>200, "sh"=>20]],
	["gallery", [ "action"=>"insert", "categoryid"=>1, "title"=>"Test item two", "description"=>"Product item for test, description number two.", "price"=>100, "bv"=>100, "sh"=>10]],
	["package", [ "action"=>"insert", "title"=>"Test package one", "description"=>"Package for test, description number one.", "price"=>900, "bv"=>1000, "sh"=>50, "sumnum"=>5, "typeid"=>1]],
	["package", [ "action"=>"insert", "title"=>"Test package two", "description"=>"Package for test, description number two.", "price"=>600, "bv"=>600,  "sh"=>40, "sumnum"=>4, "typeid"=>2]],
	["package", [ "action"=>"insert", "title"=>"Test package thr", "description"=>"Package for test, description number thr.", "price"=>400, "bv"=>400,  "sh"=>30, "sumnum"=>3, "typeid"=>3]],
	["package", [ "action"=>"insert", "title"=>"Test package fou", "description"=>"Package for test, description number fou.", "price"=>200, "bv"=>200,  "sh"=>20, "sumnum"=>2, "typeid"=>4]],
	["package", [ "action"=>"insert", "title"=>"Test package fiv", "description"=>"Package for test, description number fiv.", "price"=>100, "bv"=>100,  "sh"=>10, "sumnum"=>1, "typeid"=>5]],
	["packagedetail", [ "action"=>"insert", "packageid"=>1, "galleryid"=>1, "num"=>4]],
	["packagedetail", [ "action"=>"insert", "packageid"=>1, "galleryid"=>2, "num"=>1]],
	["packagedetail", [ "action"=>"insert", "packageid"=>2, "galleryid"=>2, "num"=>4]],
	["packagedetail", [ "action"=>"insert", "packageid"=>3, "galleryid"=>2, "num"=>3]],
	["packagedetail", [ "action"=>"insert", "packageid"=>4, "galleryid"=>2, "num"=>4]],
	["packagedetail", [ "action"=>"insert", "packageid"=>5, "galleryid"=>2, "num"=>1]]
);

for my $item (@all) {
	my $resp = $admin->post_mockup($item->[0], $item->[1]);
	is($resp->code, 200, "status code 200");
	my $content = JSON->new->utf8(0)->decode( $resp->content() );
	die "Incorrect json return" unless ($content and $content->{data});
}

exit(0);
