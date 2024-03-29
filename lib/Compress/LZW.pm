package Compress::LZW;
{
  $Compress::LZW::VERSION = '0.03';
}
# ABSTRACT: Pure-Perl implementation of scaling LZW


use strictures;

use base 'Exporter';

BEGIN {
  our @EXPORT      = qw/compress decompress/;
  our @EXPORT_OK   = qw( $MAGIC $BITS_MASK $BLOCK_MASK $RESET_CODE );
  our %EXPORT_TAGS = (
    const => \@EXPORT_OK,
  );
}

our $MAGIC      = "\037\235";
our $BITS_MASK  = 0x1f;
our $BLOCK_MASK = 0x80;
our $RESET_CODE = 256;

use Compress::LZW::Compressor;
use Compress::LZW::Decompressor;


sub compress {
  my ( $str ) = @_;
  
  return Compress::LZW::Compressor->new()->compress( $str );
}



sub decompress {
  my ( $str ) = @_;
  
  return Compress::LZW::Decompressor->new()->decompress( $str );
}  


sub _detect_lsb_first {
  use Config;
  
  return 1 if substr($Config{byteorder},0,4) eq '1234';
  return 0;
}



1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Compress::LZW - Pure-Perl implementation of scaling LZW

=head1 VERSION

version 0.03

=head1 SYNOPSIS

 use Compress::LZW;
  
 my $compressed = compress($some_data);
 my $data       = decompress($compressed);

=head1 DESCRIPTION

C<Compress::LZW> is a perl implementation of the Lempel-Ziv-Welch
compression algorithm, which should no longer be patented worldwide.
It is shooting for loose compatibility with the flavor of LZW 
found in the classic UNIX compress(1), though there are a few
variations out there today.  I test against ncompress on Linux x86.

=head1 FUNCTIONS

=head2 compress

Accepts a scalar, returns compressed data in a scalar.

Wraps L<Compress::LZW::Compressor>

=head2 decompress

Accepts a (compressed) scalar, returns decompressed data in a scalar.

Wraps L<Compress::LZW::Deompressor>

=head1 EXPORTS

C<compress> C<decompress>

=head1 SEE ALSO

The implementations, L<Compress::LZW::Compressor> and L<Compress::LZW::Decompressor>.

Other Compress::* modules, especially Compress::LZV1, Compress::LZF and Compress::Zlib.

I definitely studied some other implementations that deserve credit, in particular: Sean O'Rourke, E<lt>SEANOE<gt> - Original author, C<Compress::SelfExtracting>, and another by Rocco Caputo
which was posted online.

=head1 AUTHOR

Meredith Howard <mhoward@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Meredith Howard.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
