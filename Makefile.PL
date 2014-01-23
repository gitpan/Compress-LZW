
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Pure-Perl implementation of scaling LZW",
  "AUTHOR" => "Meredith Howard <mhoward\@cpan.org>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Compress-LZW",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Compress::LZW",
  "PREREQ_PM" => {
    "Exporter" => 0,
    "Moo" => 0,
    "Types::Standard" => 0,
    "base" => 0,
    "namespace::clean" => 0,
    "strictures" => 0
  },
  "TEST_REQUIRES" => {
    "Test::More" => 0
  },
  "VERSION" => "0.03",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Exporter" => 0,
  "Moo" => 0,
  "Test::More" => 0,
  "Types::Standard" => 0,
  "base" => 0,
  "namespace::clean" => 0,
  "strictures" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



