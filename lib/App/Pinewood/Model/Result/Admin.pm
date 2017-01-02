use utf8;
package App::Pinewood::Model::Result::Admin;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

App::Pinewood::Model::Result::Admin

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<admins>

=cut

__PACKAGE__->table("admins");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'admins_id_seq'

=head2 auth_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 event_group_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "admins_id_seq",
  },
  "auth_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "event_group_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 auth

Type: belongs_to

Related object: L<App::Pinewood::Model::Result::Auth>

=cut

__PACKAGE__->belongs_to(
  "auth",
  "App::Pinewood::Model::Result::Auth",
  { id => "auth_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 event_group

Type: belongs_to

Related object: L<App::Pinewood::Model::Result::EventGroup>

=cut

__PACKAGE__->belongs_to(
  "event_group",
  "App::Pinewood::Model::Result::EventGroup",
  { id => "event_group_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2017-01-01 22:15:35
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:krSHOZqTSY/SorLHcFP5Cg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
