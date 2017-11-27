#!/usr/bin/perl

use Socket;
use Term::ANSIColor;
use WWW::Mechanize;
use JSON;

  
print q{

------------------
$  Skull Hacker  $
------------------
      .-~~-.
     (_*..*_)
       ||||
       ||||
       `--' 
Ip Geolocation Tool  
By : Naveen Chowdary

};
 

@iphost=$ARGV[0] || die "Usage : ./iplookup.pl [website] [Public ip]  \n\nEx:  ./iplookup.pl  www.facebook.com \n     ./iplookup.pl  31.13.78.35\n \n";
my @ip = inet_ntoa(scalar gethostbyname("@iphost")or die "IP or Host invalid!\n");
my @hn = scalar gethostbyaddr(inet_aton(@ip),AF_INET);
 
my $GET=WWW::Mechanize->new();
    $GET->get("http://ip-api.com/json/@ip"); # JSON API OF IP-API.COM
    my $json = $GET->content();
 
 
my $info = decode_json($json);


 
print "  [*] IP: ", $info->{'query'}, "\n"; 
print "  [+] ISP: ", $info->{'isp'}, "\n";
print "  [+] ORG: ", $info->{'as'}, "\n";
print "  [+] Country: ", $info->{'country'}, "\n";
print "  [+] Country code: ", $info->{'countryCode'}, "\n"; 
print "  [+] City: ", $info->{'city'}, "\n";
print "  [+] Region: ", $info->{'regionName'}, " - " , $info->{'region'}, "\n";
print "  [+] Zip code: ", $info->{'zip'}, "\n";
print "  [+] Time: ",  $info->{'timezone'},  "\n";
print "  [+] Geo: ", "Lat: " , $info->{'lat'}, " - Long: ", $info->{'lon'}, "\n";
print "  [+] Status: ", $info->{'status'}, "\n"; 
print "\n";

