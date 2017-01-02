use utf8;
package App::Pinewood::Model::Result::RacerRun;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

App::Pinewood::Model::Result::RacerRun

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

=head1 TABLE: C<racer_runs>

=cut

__PACKAGE__->table("racer_runs");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'racer_runs_id_seq'

=head2 race_number

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 racer_id

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
  "race_number",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "racer_id",
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

=item * L</race_number>

=item * L</racer_id>

=back

=cut

__PACKAGE__->add_unique_constraint(
  "racer_runs_race_id_racer_id_key",
  ["race_number", "racer_id"],
);

=head1 RELATIONS

=head2 race_number

Type: belongs_to

Related object: L<App::Pinewood::Model::Result::RaceSchedule>

=cut

__PACKAGE__->belongs_to(
  "race_number",
  "App::Pinewood::Model::Result::RaceSchedule",
  { id => "race_number" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 racer

Type: belongs_to

Related object: L<App::Pinewood::Model::Result::Racer>

=cut

__PACKAGE__->belongs_to(
  "racer",
  "App::Pinewood::Model::Result::Racer",
  { id => "racer_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2017-01-01 22:15:35
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/M2JIkmjIWXGkhVjNRfy7w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
