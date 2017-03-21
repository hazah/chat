Warden::Manager.after_set_user do |user, auth, opts|
  auth.cookies.signed["#{opts[:scope]}.id"] = user.id
end

Warden::Manager.before_logout do |user, auth, opts|
  auth.cookies.signed["#{opts[:scope]}.id"] = nil
end