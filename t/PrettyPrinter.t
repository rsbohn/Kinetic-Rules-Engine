#!/usr/bin/perl -w

#
# Copyright 2007-2009, Kynetx Inc.  All rights reserved.
#
# This Software is an unpublished, proprietary work of Kynetx Inc.
# Your access to it does not grant you any rights, including, but not
# limited to, the right to install, execute, copy, transcribe, reverse
# engineer, or transmit it by any means.  Use of this Software is
# governed by the terms of a Software License Agreement transmitted
# separately.
#
# Any reproduction, redistribution, or reverse engineering of the
# Software not in accordance with the License Agreement is expressly
# prohibited by law, and may result in severe civil and criminal
# penalties. Violators will be prosecuted to the maximum extent
# possible.
#
# Without limiting the foregoing, copying or reproduction of the
# Software to any other server or location for further reproduction or
# redistribution is expressly prohibited, unless such reproduction or
# redistribution is expressly permitted by the License Agreement
# accompanying this Software.
#
# The Software is warranted, if at all, only according to the terms of
# the License Agreement. Except as warranted in the License Agreement,
# Kynetx Inc. hereby disclaims all warranties and conditions
# with regard to the software, including all warranties and conditions
# of merchantability, whether express, implied or statutory, fitness
# for a particular purpose, title and non-infringement.
#
use lib qw(/web/lib/perl);
use strict;

# grab the test data file names
my @krl_files = @ARGV ? @ARGV : <data/*.krl>;

# all the files in the rules repository
#my @krl_files = @ARGV ? @ARGV : </web/work/krl.kobj.net/rules/client/*.krl>;

# testing some...
#my @krl_files = <new/*.krl>;


use Test::More;
plan tests => $#krl_files+7;
use Test::LongString;
use Data::Dumper;
use Encode;

use Kynetx::Test qw/:all/;
use Kynetx::PrettyPrinter qw/:all/;
use Kynetx::Parser qw/:all/;

use Log::Log4perl qw(get_logger :levels);
Log::Log4perl->easy_init($INFO);
Log::Log4perl->easy_init($DEBUG);
my $logger = get_logger();

foreach my $f (@krl_files) {
    my ($fl,$krl_text) = getkrl($f);
    my $tree = parse_ruleset($krl_text);
    $logger->debug("$fl: ", sub {Dumper($tree)});
    # compare to text with comments removed since pp can't reinsert them.
    # Use the internal perl string structure for the compare
    my $krl = decode("UTF-8",$krl_text);
    my $result = is_string_nows(decode("UTF-8",pp($tree)), remove_comments($krl), "$f: $fl");
    die unless ($result);
}


my ($fl,$krl_text);

($fl, $krl_text) = getkrl("data/comment1.krl");
my $krl = decode("UTF-8",$krl_text);
#diag $krl;
#diag remove_comments($krl);

like(remove_comments($krl), qr/exec/, "Escaped slashes don't count");

unlike(remove_comments($krl), qr/comment offset/, "offset comments are removed");

like(remove_comments($krl), qr/comment in extended quote/, "don't remove extended quotes");

unlike(remove_comments($krl), qr/start of line/, "don't remove extended quotes");
unlike(remove_comments($krl), qr/JS comment/, "clownhats don't protect");

like(remove_comments($krl), qr/http:\/\/www.windley.com/, "double quotes protect");



1;


