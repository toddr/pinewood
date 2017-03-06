use utf8;
package App::Pinewood::Model::Pinewood::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

App::Pinewood::Model::Pinewood::Result::User

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<users>

=cut

__PACKAGE__->table("users");

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

=head2 password

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
  "password",
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

=head2 attendees

Type: has_many

Related object: L<App::Pinewood::Model::Pinewood::Result::Attendee>

=cut

__PACKAGE__->has_many(
  "attendees",
  "App::Pinewood::Model::Pinewood::Result::Attendee",
  { "foreign.user_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 group_admins

Type: has_many

Related object: L<App::Pinewood::Model::Pinewood::Result::GroupAdmin>

=cut

__PACKAGE__->has_many(
  "group_admins",
  "App::Pinewood::Model::Pinewood::Result::GroupAdmin",
  { "foreign.user_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 events

Type: many_to_many

Composing rels: L</attendees> -> event

=cut

__PACKAGE__->many_to_many("events", "attendees", "event");


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2017-03-05 23:41:40
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/KGy8J/DDryU2HmASbLHYA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
