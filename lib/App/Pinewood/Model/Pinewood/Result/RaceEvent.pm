use utf8;
package App::Pinewood::Model::Pinewood::Result::RaceEvent;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

App::Pinewood::Model::Pinewood::Result::RaceEvent

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<race_events>

=cut

__PACKAGE__->table("race_events");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'events_id_seq'

=head2 year

  data_type: 'character varying[]'
  is_nullable: 0
  size: 10

=head2 group_id

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
    sequence          => "events_id_seq",
  },
  "year",
  { data_type => "character varying[]", is_nullable => 0, size => 10 },
  "group_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<race_events_year_group_id_key>

=over 4

=item * L</year>

=item * L</group_id>

=back

=cut

__PACKAGE__->add_unique_constraint("race_events_year_group_id_key", ["year", "group_id"]);

=head1 RELATIONS

=head2 attendees

Type: has_many

Related object: L<App::Pinewood::Model::Pinewood::Result::Attendee>

=cut

__PACKAGE__->has_many(
  "attendees",
  "App::Pinewood::Model::Pinewood::Result::Attendee",
  { "foreign.event_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 group

Type: belongs_to

Related object: L<App::Pinewood::Model::Pinewood::Result::EventGroup>

=cut

__PACKAGE__->belongs_to(
  "group",
  "App::Pinewood::Model::Pinewood::Result::EventGroup",
  { id => "group_id" },
  { is_deferrable => 0, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 race_schedules

Type: has_many

Related object: L<App::Pinewood::Model::Pinewood::Result::RaceSchedule>

=cut

__PACKAGE__->has_many(
  "race_schedules",
  "App::Pinewood::Model::Pinewood::Result::RaceSchedule",
  { "foreign.race_event_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 users

Type: many_to_many

Composing rels: L</attendees> -> user

=cut

__PACKAGE__->many_to_many("users", "attendees", "user");


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2017-03-05 23:41:40
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:BRb9ih1MUNnVqOwsaSHDug


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
