use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'		=> 'Compress::LZW',
    'VERSION_FROM'	=> 'LZW.pm', # finds $VERSION
    'PREREQ_PM'		=> { },
    ($] >= 5.005 ?    ## Add these new keywords supported since 5.005
      (AUTHOR     => "Matt Howard <mhoward@hattmoward.org>") : ()),
);
