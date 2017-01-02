use utf8;
package App::Pinewood::Model::Result::Attendee;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

App::Pinewood::Model::Result::Attendee

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

=head1 TABLE: C<attendees>

=cut

__PACKAGE__->table("attendees");

=head1 ACCESSORS

=head2 racer_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 group_id

  data_type: 'integer'
  is_nullable: 0

=head2 added

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=cut

__PACKAGE__->add_columns(
  "racer_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "group_id",
  { data_type => "integer", is_nullable => 0 },
  "added",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</racer_id>

=item * L</group_id>

=back

=cut

__PACKAGE__->set_primary_key("racer_id", "group_id");

=head1 RELATIONS

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

=head2 racer_2

Type: belongs_to

Related object: L<App::Pinewood::Model::Result::EventGroup>

=cut

__PACKAGE__->belongs_to(
  "racer_2",
  "App::Pinewood::Model::Result::EventGroup",
  { id => "racer_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2017-01-01 22:15:35
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/1v69ite2H5P8qJe0U+OMA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
