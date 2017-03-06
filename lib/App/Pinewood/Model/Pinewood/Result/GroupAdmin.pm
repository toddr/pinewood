use utf8;
package App::Pinewood::Model::Pinewood::Result::GroupAdmin;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

App::Pinewood::Model::Pinewood::Result::GroupAdmin

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<group_admins>

=cut

__PACKAGE__->table("group_admins");

=head1 ACCESSORS

=head2 user_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 event_group_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "user_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "event_group_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 RELATIONS

=head2 event_group

Type: belongs_to

Related object: L<App::Pinewood::Model::Pinewood::Result::EventGroup>

=cut

__PACKAGE__->belongs_to(
  "event_group",
  "App::Pinewood::Model::Pinewood::Result::EventGroup",
  { id => "event_group_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 user

Type: belongs_to

Related object: L<App::Pinewood::Model::Pinewood::Result::User>

=cut

__PACKAGE__->belongs_to(
  "user",
  "App::Pinewood::Model::Pinewood::Result::User",
  { id => "user_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2017-03-05 23:41:40
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Jp8g2aQdVzrYXTU8kI329A


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
