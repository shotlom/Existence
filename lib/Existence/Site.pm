{
package Existence::Site;
  #use lib "$ENV{INIPATH}chr\\lib\\Hydstra";
  use Moose;
  use Moose::Util::TypeConstraints;
  
  extends 'Existence';
  
  #Hydstra modules
  use HydDllp;

  #Global Variable
  my $DEFBUFFER        = 1950;

=head1 Existence::Site

Check existence of site

=head1 VERSION

Version 0.01

=cut

has '+sitelist_filter'  => ( is => 'rw', isa => 'Str', required => 1); 

=head1 SYNOPSIS

Use this module to check existence of SITE records
     
=cut 
  
  sub site_exists {
    #called with site_exists( sitelist_filter => $site)
    my $self = shift;
    $$self{table_name} = 'site';
    $$self{return_type} = 'array';
    
    my $dllp = HydDllp->New();
    my @d = $dllp->get_db_info(
      { 'function' => 'get_db_info',
        'version'  => 3,
        'params'   => $self
      },
      $DEFBUFFER
    );
    $dllp->Close();
    
    if ( defined $d[0] ){
      return 1; 
    }
    else {
      return 0;
    }
  }
  
  
  no Moose;

=head1 AUTHOR

Sholto Maud, C<< <sholto.maud at gmail.com> >>

=head1 BUGS

Please report any bugs in the issues wiki.


=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Existence::Site

=over 4

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2014 Sholto Maud.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=cut
}
1; # End of Existence
