require 'object_factory'

when_creating_a User, auto_generate: [:auth_id], set: { provider: 'identity'  }
when_creating_a PasswordReset, generate: { user: -> { a_saved User } }
