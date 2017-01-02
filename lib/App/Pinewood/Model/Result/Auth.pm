use utf8;
package App::Pinewood::Model::Result::Auth;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

App::Pinewood::Model::Result::Auth

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

=head1 TABLE: C<auth>

=cut

__PACKAGE__->table("auth");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'auth_id_seq'

=head2 email

  data_type: 'varchar'
  is_nullable: 0
  size: 500

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 500

=head2 active

  data_type: 'boolean'
  is_nullable: 1

=head2 salt

  data_type: 'char'
  is_nullable: 0
  size: 256

=head2 password_hash

  data_type: 'char'
  is_nullable: 1
  size: 256

=head2 created

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=head2 updated

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=head2 validation_key

  data_type: 'char'
  is_nullable: 1
  size: 10

=head2 validated

  data_type: 'boolean'
  default_value: false
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "auth_id_seq",
  },
  "email",
  { data_type => "varchar", is_nullable => 0, size => 500 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 500 },
  "active",
  { data_type => "boolean", is_nullable => 1 },
  "salt",
  { data_type => "char", is_nullable => 0, size => 256 },
  "password_hash",
  { data_type => "char", is_nullable => 1, size => 256 },
  "created",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
  "updated",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
  "validation_key",
  { data_type => "char", is_nullable => 1, size => 10 },
  "validated",
  { data_type => "boolean", default_value => \"false", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<auth_email_key>

=over 4

=item * L</email>

=back

=cut

__PACKAGE__->add_unique_constraint("auth_email_key", ["email"]);

=head1 RELATIONS

=head2 admins

Type: has_many

Related object: L<App::Pinewood::Model::Result::Admin>

=cut

__PACKAGE__->has_many(
  "admins",
  "App::Pinewood::Model::Result::Admin",
  { "foreign.auth_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 racer

Type: might_have

Related object: L<App::Pinewood::Model::Result::Racer>

=cut

__PACKAGE__->might_have(
  "racer",
  "App::Pinewood::Model::Result::Racer",
  { "foreign.auth_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2017-01-01 22:15:35
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:vFEPqGRY40lA6SmMUay7/A


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
