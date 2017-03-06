use utf8;
package App::Pinewood::Model::Pinewood::Result::EventGroup;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

App::Pinewood::Model::Pinewood::Result::EventGroup

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<event_groups>

=cut

__PACKAGE__->table("event_groups");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'event_groups_id_seq'

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 50

=head2 location

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 created

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=head2 race_reporting_uuid

  data_type: 'char'
  is_nullable: 1
  size: 36

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "event_groups_id_seq",
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 50 },
  "location",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "created",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
  "race_reporting_uuid",
  { data_type => "char", is_nullable => 1, size => 36 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<event_groups_race_reporting_uuid_key>

=over 4

=item * L</race_reporting_uuid>

=back

=cut

__PACKAGE__->add_unique_constraint(
  "event_groups_race_reporting_uuid_key",
  ["race_reporting_uuid"],
);

=head1 RELATIONS

=head2 group_admins

Type: has_many

Related object: L<App::Pinewood::Model::Pinewood::Result::GroupAdmin>

=cut

__PACKAGE__->has_many(
  "group_admins",
  "App::Pinewood::Model::Pinewood::Result::GroupAdmin",
  { "foreign.event_group_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 race_events

Type: has_many

Related object: L<App::Pinewood::Model::Pinewood::Result::RaceEvent>

=cut

__PACKAGE__->has_many(
  "race_events",
  "App::Pinewood::Model::Pinewood::Result::RaceEvent",
  { "foreign.group_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2017-03-05 23:41:40
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8eaZ5xHrxL4GDelhcFsZmw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
