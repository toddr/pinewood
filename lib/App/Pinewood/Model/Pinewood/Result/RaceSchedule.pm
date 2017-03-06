use utf8;
package App::Pinewood::Model::Pinewood::Result::RaceSchedule;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

App::Pinewood::Model::Pinewood::Result::RaceSchedule

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<race_schedule>

=cut

__PACKAGE__->table("race_schedule");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'races_id_seq'

=head2 race_event_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 race_number

  data_type: 'smallint'
  is_nullable: 0

=head2 complete

  data_type: 'boolean'
  default_value: false
  is_nullable: 0

=head2 lanes

  data_type: 'smallint'
  default_value: 6
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "races_id_seq",
  },
  "race_event_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "race_number",
  { data_type => "smallint", is_nullable => 0 },
  "complete",
  { data_type => "boolean", default_value => \"false", is_nullable => 0 },
  "lanes",
  { data_type => "smallint", default_value => 6, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<races_event_id_race_number_key>

=over 4

=item * L</race_event_id>

=item * L</race_number>

=back

=cut

__PACKAGE__->add_unique_constraint(
  "races_event_id_race_number_key",
  ["race_event_id", "race_number"],
);

=head1 RELATIONS

=head2 race_event

Type: belongs_to

Related object: L<App::Pinewood::Model::Pinewood::Result::RaceEvent>

=cut

__PACKAGE__->belongs_to(
  "race_event",
  "App::Pinewood::Model::Pinewood::Result::RaceEvent",
  { id => "race_event_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 racer_runs

Type: has_many

Related object: L<App::Pinewood::Model::Pinewood::Result::RacerRun>

=cut

__PACKAGE__->has_many(
  "racer_runs",
  "App::Pinewood::Model::Pinewood::Result::RacerRun",
  { "foreign.race_schedule_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2017-03-05 23:41:40
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:o7rE1xJbuQZ0VztXFP2aIQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
