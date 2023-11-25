{
  type: :object,
  properties: {
    id: {type: :integer},
    firstName: {type: :string},
    lastName: {type: :string},
    middleName: {type: :string},
    authToken: {type: :string},
    email: {type: :string},
    type: {type: :string},
    phone: {type: :string},
  },
  required: %i[],
  additionalProperties: false
}
