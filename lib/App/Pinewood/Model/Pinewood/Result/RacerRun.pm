use utf8;
package App::Pinewood::Model::Pinewood::Result::RacerRun;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

App::Pinewood::Model::Pinewood::Result::RacerRun

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<racer_runs>

=cut

__PACKAGE__->table("racer_runs");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'racer_runs_id_seq'

=head2 race_schedule_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 car_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 milliseconds

  data_type: 'smallint'
  is_nullable: 0

=head2 lane

  data_type: 'smallint'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "racer_runs_id_seq",
  },
  "race_schedule_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "car_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "milliseconds",
  { data_type => "smallint", is_nullable => 0 },
  "lane",
  { data_type => "smallint", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<racer_runs_race_id_racer_id_key>

=over 4

=item * L</race_schedule_id>

=item * L</car_id>

=back

=cut

__PACKAGE__->add_unique_constraint(
  "racer_runs_race_id_racer_id_key",
  ["race_schedule_id", "car_id"],
);

=head1 RELATIONS

=head2 car

Type: belongs_to

Related object: L<App::Pinewood::Model::Pinewood::Result::Car>

=cut

__PACKAGE__->belongs_to(
  "car",
  "App::Pinewood::Model::Pinewood::Result::Car",
  { id => "car_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 race_schedule

Type: belongs_to

Related object: L<App::Pinewood::Model::Pinewood::Result::RaceSchedule>

=cut

__PACKAGE__->belongs_to(
  "race_schedule",
  "App::Pinewood::Model::Pinewood::Result::RaceSchedule",
  { id => "race_schedule_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2017-03-05 23:41:40
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:TgicBUOAxPxbHGQZNVkMbg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
