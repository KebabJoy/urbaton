{
  type: :object,
  properties: {
    id: {type: :integer},
    body: {type: :string},
    title: {type: :string},
    status: {type: :string, enum: %w[published pending desc declined]},
    type: {type: :string},
    pictureUrl: {type: :string, nullable: true},
    author: {
      type: :object,
      properties: {
        fullName: {type: :string},
        phone: {type: :string},
        email: {type: :string}
      }
    }
  },
  required: %i[],
  additionalProperties: false
}
