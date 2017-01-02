use utf8;
package App::Pinewood::Model::Result::Racer;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

App::Pinewood::Model::Result::Racer

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

=head1 TABLE: C<racers>

=cut

__PACKAGE__->table("racers");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'racers_id_seq'

=head2 imageid

  data_type: 'integer'
  is_nullable: 1

=head2 auth_id

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
    sequence          => "racers_id_seq",
  },
  "imageid",
  { data_type => "integer", is_nullable => 1 },
  "auth_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<racers_auth_id_key>

=over 4

=item * L</auth_id>

=back

=cut

__PACKAGE__->add_unique_constraint("racers_auth_id_key", ["auth_id"]);

=head1 RELATIONS

=head2 attendees

Type: has_many

Related object: L<App::Pinewood::Model::Result::Attendee>

=cut

__PACKAGE__->has_many(
  "attendees",
  "App::Pinewood::Model::Result::Attendee",
  { "foreign.racer_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

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

=head2 race_schedule_lane1s

Type: has_many

Related object: L<App::Pinewood::Model::Result::RaceSchedule>

=cut

__PACKAGE__->has_many(
  "race_schedule_lane1s",
  "App::Pinewood::Model::Result::RaceSchedule",
  { "foreign.lane1_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 race_schedule_lane2s

Type: has_many

Related object: L<App::Pinewood::Model::Result::RaceSchedule>

=cut

__PACKAGE__->has_many(
  "race_schedule_lane2s",
  "App::Pinewood::Model::Result::RaceSchedule",
  { "foreign.lane2_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 race_schedule_lane3s

Type: has_many

Related object: L<App::Pinewood::Model::Result::RaceSchedule>

=cut

__PACKAGE__->has_many(
  "race_schedule_lane3s",
  "App::Pinewood::Model::Result::RaceSchedule",
  { "foreign.lane3_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 race_schedule_lane4s

Type: has_many

Related object: L<App::Pinewood::Model::Result::RaceSchedule>

=cut

__PACKAGE__->has_many(
  "race_schedule_lane4s",
  "App::Pinewood::Model::Result::RaceSchedule",
  { "foreign.lane4_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 race_schedule_lane5s

Type: has_many

Related object: L<App::Pinewood::Model::Result::RaceSchedule>

=cut

__PACKAGE__->has_many(
  "race_schedule_lane5s",
  "App::Pinewood::Model::Result::RaceSchedule",
  { "foreign.lane5_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 race_schedule_lane6s

Type: has_many

Related object: L<App::Pinewood::Model::Result::RaceSchedule>

=cut

__PACKAGE__->has_many(
  "race_schedule_lane6s",
  "App::Pinewood::Model::Result::RaceSchedule",
  { "foreign.lane6_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 racer_runs

Type: has_many

Related object: L<App::Pinewood::Model::Result::RacerRun>

=cut

__PACKAGE__->has_many(
  "racer_runs",
  "App::Pinewood::Model::Result::RacerRun",
  { "foreign.racer_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2017-01-01 22:15:35
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:A7qtCe0DtqR3s766wcsjVA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
