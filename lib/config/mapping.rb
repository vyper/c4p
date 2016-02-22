collection :users do
  entity     User
  repository UserRepository

  attribute :id,                  String
  attribute :name,                String
  attribute :email,               String
  attribute :encrypted_password,  String
  attribute :created_at,          DateTime
  attribute :updated_at,          DateTime
end

collection :authentications do
  entity     Authentication
  repository AuthenticationRepository

  attribute :id,          String
  attribute :user_id,     String
  attribute :uid,         String
  attribute :provider,    String
  attribute :created_at,  DateTime
  attribute :updated_at,  DateTime
end

collection :events do
  entity     Event
  repository EventRepository

  attribute :id,          String
  attribute :owner_id,    String
  attribute :name,        String
  attribute :description, String
  attribute :tags,        PGCITextArray
  attribute :created_at,  DateTime
  attribute :updated_at,  DateTime
end

collection :talks do
  entity     Talk
  repository TalkRepository

  attribute :id,          String
  attribute :event_id,    String
  attribute :author_id,   String
  attribute :name,        String
  attribute :description, String
  attribute :created_at,  DateTime
  attribute :updated_at,  DateTime
end
