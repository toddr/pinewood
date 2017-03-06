use utf8;
package App::Pinewood::Model::Pinewood::Result::Car;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

App::Pinewood::Model::Pinewood::Result::Car

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<cars>

=cut

__PACKAGE__->table("cars");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'racers_id_seq'

=head2 pictures

  data_type: 'integer[]'
  is_nullable: 1

=head2 car_name

  data_type: 'text'
  is_nullable: 0
  original: {data_type => "varchar"}

=head2 weight

  data_type: 'real'
  default_value: 5.0
  is_nullable: 1

=head2 checkin_date

  data_type: 'timestamp'
  is_nullable: 1

=head2 den

  data_type: 'text'
  is_nullable: 0
  original: {data_type => "varchar"}

=head2 owner_name

  data_type: 'text'
  is_nullable: 1
  original: {data_type => "varchar"}

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "racers_id_seq",
  },
  "pictures",
  { data_type => "integer[]", is_nullable => 1 },
  "car_name",
  {
    data_type   => "text",
    is_nullable => 0,
    original    => { data_type => "varchar" },
  },
  "weight",
  { data_type => "real", default_value => "5.0", is_nullable => 1 },
  "checkin_date",
  { data_type => "timestamp", is_nullable => 1 },
  "den",
  {
    data_type   => "text",
    is_nullable => 0,
    original    => { data_type => "varchar" },
  },
  "owner_name",
  {
    data_type   => "text",
    is_nullable => 1,
    original    => { data_type => "varchar" },
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 racer_runs

Type: has_many

Related object: L<App::Pinewood::Model::Pinewood::Result::RacerRun>

=cut

__PACKAGE__->has_many(
  "racer_runs",
  "App::Pinewood::Model::Pinewood::Result::RacerRun",
  { "foreign.car_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2017-03-05 23:41:40
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:W0qWWjsZwwzNexVnyOMtaQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
