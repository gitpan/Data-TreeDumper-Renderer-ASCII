package Data::TreeDumper::Renderer::ASCII;

use 5.006;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);

our %EXPORT_TAGS = ( 'all' => [ qw() ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw();

our $VERSION = '0.01';

#-------------------------------------------------------------------------------------------
sub GetRenderer
{
# setup arguments can be passed to the renderer

return
	(
		{
		  BEGIN => sub{"$_[0]\n"}
		, NODE  => \&RenderAsciiNode
		, END   => sub{''}
		}
	) ;
}


#-------------------------------------------------------------------------------------------

sub RenderAsciiNode
{
# a simple proof of concept, no config is handled

my
	(
	  $element
	, $level
	, $is_terminal
	, $previous_level_separator
	, $separator
	, $element_name
	, $element_value
	, $dtd_address
	, $address_field
	, $perl_data
	, $setup
	) = @_ ;

$element_value = " = $element_value" if($element_value ne '') ;

"$previous_level_separator$separator $element_name$element_value $address_field\n" ;
} 
	
#-------------------------------------------------------------------------------------------

1 ;

__END__

=head1 NAME

Data::TreeDumper::Renderer::ASCII - proof of concept renderer for B<Data::TreeDumper>

=head1 SYNOPSIS

  # Auto load
  print DumpTree($s, 'Tree', RENDERER => 'ASCII') ;
  
  # Manual load
  print DumpTree
  	(
  	  $s
  	, 'Tree'
  	, RENDERER => Data::TreeDumper::Renderer::ASCII::GetRenderer("argument")
  	) ;

=head1 DESCRIPTION

Proof of concept renderer for B<Data::TreeDumper>.

=head1 Bugs

None I know of in this release but plenty, lurking in the dark corners, waiting to be found.

=head1 EXPORT

None

=head1 AUTHOR

Khemir Nadim ibn Hamouda. <nadim@khemir.net>

  Copyright (c) 2003 Nadim Ibn Hamouda el Khemir. All rights
  reserved.  This program is free software; you can redis-
  tribute it and/or modify it under the same terms as Perl
  itself.
  
If you find any value in this module, mail me!  All hints, tips, flames and wishes
are welcome at <nadim@khemir.net>.

=head1 SEE ALSO

B<Data::TreeDumper>.

=cut

