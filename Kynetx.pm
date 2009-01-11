

package Kynetx;
# file: Kynetx.pm

use strict;
use warnings;


use XML::XPath;
use LWP::Simple;
use DateTime;
use Log::Log4perl qw(get_logger :levels);
use Cache::Memcached;
use JSON::XS;

use Kynetx::Rules qw(:all);;
use Kynetx::Util qw(:all);;
use Kynetx::Session qw(:all);
use Kynetx::Memcached qw(:all);
use Kynetx::RuleManager qw(:all);
use Kynetx::Console qw(:all);;


# FIXME: get this from config
use constant DEFAULT_TEMPLATE_DIR => '/web/lib/perl/etc/tmpl';

# Make this global so we can use memcache all over
our $memd;

my $s = Apache2::ServerUtil->server;

sub handler {
    my $r = shift;

    # configure logging for production, development, etc.
    config_logging($r);

    my $logger = get_logger();

    $r->content_type('text/javascript');
    
    my @host_array = $r->dir_config->get('memcached_hosts');

    # Fixme: the whole thing fails if @host_array not defined...else?
    if($r->dir_config('memcached_hosts')) {
	$logger->debug("Initializing memcached with ", join(", ", @host_array));
	Kynetx::Memcached->init(\@host_array);
    }

    # at some point we need a better dispatch function
    if($r->path_info =~ m!/eval/! ) {
	process_rules($r);
    } elsif($r->path_info =~ m!/flush/! ) {
	flush_ruleset_cache($r);
    } elsif($r->path_info =~ m!/console/! ) {
	show_context($r);
    } elsif($r->path_info =~ m!/describe/! ) {
	describe_ruleset($r);
    } elsif($r->path_info =~ m!/foo/! ) {
	my $uniq = int(rand 999999999);
	$r->content_type('text/html');
	print "$uniq";
	

    } else {

	process_rules($r);
    }

    return Apache2::Const::OK; 
}

1;






sub flush_ruleset_cache {
    my ($r) = @_;

    # nothing to do if no memcache hosts
    return unless $r->dir_config('memcached_hosts');

    my $logger = get_logger();

    my ($site) = $r->path_info =~ m#/flush/(.+)#;

    Log::Log4perl::MDC->put('site', $site);
    Log::Log4perl::MDC->put('rule', '[global]');  # no rule for now...


    $logger->debug("[flush] flushing rules for $site");
    my $memd = get_memd();
    $memd->delete("ruleset:$site");

    $r->content_type('text/html');
    my $msg = "Rules flushed for site $site";
    print "<title>$msg</title><h1>$msg</h1>";

}

sub describe_ruleset {
    my ($r) = @_;

    my $logger = get_logger();


    my ($site) = $r->path_info =~ m#/describe/(.+)#;

    Log::Log4perl::MDC->put('site', $site);
    Log::Log4perl::MDC->put('rule', '[describe]');  # no rule for now...

    my $req = Apache2::Request->new($r);
    my $flavor = $req->param('flavor') || 'html';


    $logger->debug("Getting ruleset $site");

    my %req_info;

    my $ruleset = Kynetx::Rules::get_rules_from_repository($site, $r->dir_config('svn_conn'), \%req_info);

    my $numrules = @{ $ruleset->{'rules'} } + 0;

    $logger->debug("Found $numrules rules..." );


    my($active)  = 0;
    my($inactive) = 0;
    foreach my $rule ( @{ $ruleset->{'rules'} } ) {

	if($rule->{'state'} eq 'active') {  
	    $active++;
	} elsif($rule->{'state'} eq 'inactive') {  
	    $inactive++;
	}

    }

    my ($data) = {
	'ruleset_id' => $ruleset->{'ruleset_name'},
	'ruleset_version' => $req_info{'rule_version'},
	'number_of_rules' => $numrules,
	'number_of_active_rules' => $active,
	'number_of_inactive_rules' => $inactive,
	'description' => $ruleset->{'meta'}->{'description'},
    };
    
    if($flavor eq 'json') {
	$r->content_type('text/plain');
	print encode_json($data) ;
    } else {
	# print the page
	my $template = DEFAULT_TEMPLATE_DIR . "/describe.tmpl";
	my $test_template = HTML::Template->new(filename => $template);

	$test_template->param(RULESET_ID => $data->{'ruleset_id'});
	$test_template->param(DATA => encode_json($data));

	
	$r->content_type('text/html');
	print $test_template->output;
    }
}
